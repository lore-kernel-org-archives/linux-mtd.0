Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYBSG-0008Gw-3w
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 10:44:13 +0000
Message-ID: <550956D7.9030309@codeaurora.org>
Date: Wed, 18 Mar 2015 12:43:35 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, ricard.wanderlof@axis.com
Subject: Re: [PATCH 2/2] ubi-utils: ubinize: Add fastmap suport to image
 creation
References: <1426668763-6463-1-git-send-email-tlinder@codeaurora.org>
 <550951C9.2040509@nod.at>
In-Reply-To: <550951C9.2040509@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Sorry for this taking so long. Had some legal issues to overcome.

On 3/18/2015 12:22 PM, Richard Weinberger wrote:
> Hi!
>
> Am 18.03.2015 um 09:52 schrieb Tanya Brokhman:
>> While generating ubi image with ubinize, all UBI data required for
>> Fastmap is present. If we generate the Fastmap data as part of the
>> image, the first boot after flash won't require full scan of the UBI
>> device.
>> In order to be able to generate the Fastmap data number of device
>> PEBs is required. If this input parameter was not provided - Fastmap
>> will not be generated.
>>
>> Note: In order for this to work properly change is required in flasher
>> as well:
>> If while flashing the image bad blocks were discovered, Fastmap
>> should be invalidated in the flashed image. Fastmap superblock
>> (if present) will be in PEB#2 in the image.
>
> I didn't look at the implementation in detail as I'm still recovering from a flu.
>
> NAND is allowed to have bad blocks, therefore a lot of freshly flashed
> UBI images won't be able to use fastmap.

Yes, that's why I added the disclaimer that this patch can only be used 
if the flasher code is updated as well. This is how I did it for our 
products. We have a proprietary flasher.

> What also puzzles me is that it will just work with a non-fastmap aware flasher.
> But boards with bad blocks will blow up at (much) later and Joe random user will curse UBI. :)

That is correct. Note that if we don't provide the "-c" parameter to 
ubinize, all works as before and fastmap data wont be generated. "-c" is 
not a must. So users that don't update their flashers (don't make them 
fastmap aware) will just continue generating images without -c and 
fastmap wont be generated. It is backward compatible. (and they will 
have to look for other reasons to curse UBI :) )

>
> Maybe it would make sense to but the whole fastmap creation logic into the flasher.

But then you will delay the flashing process and this time is valuable. 
We're always looking for ways to decrease flashing of the images and the 
first boot duration.
Also, if you move this logic inside the flasher, perhaps we can skip 
ubinize at all since it feels like the logic will be just duplicated.

> We could create a libfastmap (LGPLv2) such that everyone is allowed to use it in his custom
> flasher.

Perhaps. It wont work for us though, so unfortunately I wont be able to 
help out with that if this is the solution you prefer.

>
> Thanks,
> //richard
>
>> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>> ---
>>   Makefile                        |   2 +-
>>   include/linux/list.h            | 599 ++++++++++++++++++++++++++++++++++++++++
>>   include/mtd/ubi-media.h         |   4 +
>>   ubi-utils/include/libubigen.h   |  25 +-
>>   ubi-utils/include/ubi-fastmap.h | 217 +++++++++++++++
>>   ubi-utils/libubigen.c           |  80 ++++--
>>   ubi-utils/mtdinfo.c             |   2 +-
>>   ubi-utils/ubi-fastmap.c         | 358 ++++++++++++++++++++++++
>>   ubi-utils/ubiformat.c           |   6 +-
>>   ubi-utils/ubinize.c             |  71 ++++-
>>   10 files changed, 1324 insertions(+), 40 deletions(-)
>>   create mode 100644 include/linux/list.h
>>   create mode 100644 ubi-utils/include/ubi-fastmap.h
>>   create mode 100644 ubi-utils/ubi-fastmap.c
>>
>> diff --git a/Makefile b/Makefile
>> index eade234..bf0ada7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -117,7 +117,7 @@ obj-libubi.a       = libubi.o
>>   obj-libubigen.a    = libubigen.o
>>
>>   obj-mtdinfo   = libubigen.a
>> -obj-ubinize   = libubigen.a libiniparser.a
>> +obj-ubinize   = libubigen.a libiniparser.a ubi-fastmap.o
>>   obj-ubiformat = libubigen.a libscan.a
>>
>>   $(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
>> diff --git a/include/linux/list.h b/include/linux/list.h
>> new file mode 100644
>> index 0000000..afcc469
>> --- /dev/null
>> +++ b/include/linux/list.h
>> @@ -0,0 +1,599 @@
>> +/*
>> + *
>> + * Simple doubly linked list implementation.
>> + *
>> + * This file was (partly) imported from kernel/include/linux/list.h
>> + *
>> + * Some of the internal functions ("__xxx") are useful when
>> + * manipulating whole lists rather than single entries, as
>> + * sometimes we already know the next/prev entries and we can
>> + * generate better code by using them directly rather than
>> + * using the generic single-entry routines.
>> + */
>> +
>> +#ifndef _LINUX_LIST_H
>> +#define _LINUX_LIST_H
>> +
>> +#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
>> +
>> +/**
>> + * container_of - cast a member of a structure out to the containing structure
>> + * @ptr:	the pointer to the member.
>> + * @type:	the type of the container struct this is embedded in.
>> + * @member:	the name of the member within the struct.
>> + *
>> + */
>> +#define container_of(ptr, type, member) ({			\
>> +	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
>> +	(type *)( (char *)__mptr - offsetof(type,member) );})
>> +
>> +struct list_head {
>> +	struct list_head *next, *prev;
>> +};
>> +
>> +#define LIST_HEAD_INIT(name) { &(name), &(name) }
>> +
>> +#define LIST_HEAD(name) \
>> +	struct list_head name = LIST_HEAD_INIT(name)
>> +
>> +static inline void INIT_LIST_HEAD(struct list_head *list)
>> +{
>> +	list->next = list;
>> +	list->prev = list;
>> +}
>> +
>> +/*
>> + * Insert a new entry between two known consecutive entries.
>> + *
>> + * This is only for internal list manipulation where we know
>> + * the prev/next entries already!
>> + */
>> +static inline void __list_add(struct list_head *new,
>> +			      struct list_head *prev,
>> +			      struct list_head *next)
>> +{
>> +	next->prev = new;
>> +	new->next = next;
>> +	new->prev = prev;
>> +	prev->next = new;
>> +}
>> +
>> +/**
>> + * list_add - add a new entry
>> + * @new: new entry to be added
>> + * @head: list head to add it after
>> + *
>> + * Insert a new entry after the specified head.
>> + * This is good for implementing stacks.
>> + */
>> +static inline void list_add(struct list_head *new, struct list_head *head)
>> +{
>> +	__list_add(new, head, head->next);
>> +}
>> +
>> +
>> +/**
>> + * list_add_tail - add a new entry
>> + * @new: new entry to be added
>> + * @head: list head to add it before
>> + *
>> + * Insert a new entry before the specified head.
>> + * This is useful for implementing queues.
>> + */
>> +static inline void list_add_tail(struct list_head *new, struct list_head *head)
>> +{
>> +	__list_add(new, head->prev, head);
>> +}
>> +
>> +/*
>> + * Delete a list entry by making the prev/next entries
>> + * point to each other.
>> + *
>> + * This is only for internal list manipulation where we know
>> + * the prev/next entries already!
>> + */
>> +static inline void __list_del(struct list_head *prev, struct list_head *next)
>> +{
>> +	next->prev = prev;
>> +	prev->next = next;
>> +}
>> +
>> +/**
>> + * list_del - deletes entry from list.
>> + * @entry: the element to delete from the list.
>> + * Note: list_empty() on entry does not return true after this, the entry is
>> + * in an undefined state.
>> + */
>> +static inline void __list_del_entry(struct list_head *entry)
>> +{
>> +	__list_del(entry->prev, entry->next);
>> +}
>> +
>> +/*
>> + * These are non-NULL pointers that will result in page faults
>> + * under normal circumstances, used to verify that nobody uses
>> + * non-initialized list entries.
>> + */
>> +#define LIST_POISON1  ((void *) 0x00100100)
>> +#define LIST_POISON2  ((void *) 0x00200200)
>> +
>> +static inline void list_del(struct list_head *entry)
>> +{
>> +	__list_del(entry->prev, entry->next);
>> +	entry->next = LIST_POISON1;
>> +	entry->prev = LIST_POISON2;
>> +}
>> +
>> +/**
>> + * list_replace - replace old entry by new one
>> + * @old : the element to be replaced
>> + * @new : the new element to insert
>> + *
>> + * If @old was empty, it will be overwritten.
>> + */
>> +static inline void list_replace(struct list_head *old,
>> +				struct list_head *new)
>> +{
>> +	new->next = old->next;
>> +	new->next->prev = new;
>> +	new->prev = old->prev;
>> +	new->prev->next = new;
>> +}
>> +
>> +static inline void list_replace_init(struct list_head *old,
>> +					struct list_head *new)
>> +{
>> +	list_replace(old, new);
>> +	INIT_LIST_HEAD(old);
>> +}
>> +
>> +/**
>> + * list_del_init - deletes entry from list and reinitialize it.
>> + * @entry: the element to delete from the list.
>> + */
>> +static inline void list_del_init(struct list_head *entry)
>> +{
>> +	__list_del_entry(entry);
>> +	INIT_LIST_HEAD(entry);
>> +}
>> +
>> +/**
>> + * list_move - delete from one list and add as another's head
>> + * @list: the entry to move
>> + * @head: the head that will precede our entry
>> + */
>> +static inline void list_move(struct list_head *list, struct list_head *head)
>> +{
>> +	__list_del_entry(list);
>> +	list_add(list, head);
>> +}
>> +
>> +/**
>> + * list_move_tail - delete from one list and add as another's tail
>> + * @list: the entry to move
>> + * @head: the head that will follow our entry
>> + */
>> +static inline void list_move_tail(struct list_head *list,
>> +				  struct list_head *head)
>> +{
>> +	__list_del_entry(list);
>> +	list_add_tail(list, head);
>> +}
>> +
>> +/**
>> + * list_is_last - tests whether @list is the last entry in list @head
>> + * @list: the entry to test
>> + * @head: the head of the list
>> + */
>> +static inline int list_is_last(const struct list_head *list,
>> +				const struct list_head *head)
>> +{
>> +	return list->next == head;
>> +}
>> +
>> +/**
>> + * list_empty - tests whether a list is empty
>> + * @head: the list to test.
>> + */
>> +static inline int list_empty(const struct list_head *head)
>> +{
>> +	return head->next == head;
>> +}
>> +
>> +/**
>> + * list_empty_careful - tests whether a list is empty and not being modified
>> + * @head: the list to test
>> + *
>> + * Description:
>> + * tests whether a list is empty _and_ checks that no other CPU might be
>> + * in the process of modifying either member (next or prev)
>> + *
>> + * NOTE: using list_empty_careful() without synchronization
>> + * can only be safe if the only activity that can happen
>> + * to the list entry is list_del_init(). Eg. it cannot be used
>> + * if another CPU could re-list_add() it.
>> + */
>> +static inline int list_empty_careful(const struct list_head *head)
>> +{
>> +	struct list_head *next = head->next;
>> +	return (next == head) && (next == head->prev);
>> +}
>> +
>> +/**
>> + * list_rotate_left - rotate the list to the left
>> + * @head: the head of the list
>> + */
>> +static inline void list_rotate_left(struct list_head *head)
>> +{
>> +	struct list_head *first;
>> +
>> +	if (!list_empty(head)) {
>> +		first = head->next;
>> +		list_move_tail(first, head);
>> +	}
>> +}
>> +
>> +/**
>> + * list_is_singular - tests whether a list has just one entry.
>> + * @head: the list to test.
>> + */
>> +static inline int list_is_singular(const struct list_head *head)
>> +{
>> +	return !list_empty(head) && (head->next == head->prev);
>> +}
>> +
>> +static inline void __list_cut_position(struct list_head *list,
>> +		struct list_head *head, struct list_head *entry)
>> +{
>> +	struct list_head *new_first = entry->next;
>> +	list->next = head->next;
>> +	list->next->prev = list;
>> +	list->prev = entry;
>> +	entry->next = list;
>> +	head->next = new_first;
>> +	new_first->prev = head;
>> +}
>> +
>> +/**
>> + * list_cut_position - cut a list into two
>> + * @list: a new list to add all removed entries
>> + * @head: a list with entries
>> + * @entry: an entry within head, could be the head itself
>> + *	and if so we won't cut the list
>> + *
>> + * This helper moves the initial part of @head, up to and
>> + * including @entry, from @head to @list. You should
>> + * pass on @entry an element you know is on @head. @list
>> + * should be an empty list or a list you do not care about
>> + * losing its data.
>> + *
>> + */
>> +static inline void list_cut_position(struct list_head *list,
>> +		struct list_head *head, struct list_head *entry)
>> +{
>> +	if (list_empty(head))
>> +		return;
>> +	if (list_is_singular(head) &&
>> +		(head->next != entry && head != entry))
>> +		return;
>> +	if (entry == head)
>> +		INIT_LIST_HEAD(list);
>> +	else
>> +		__list_cut_position(list, head, entry);
>> +}
>> +
>> +static inline void __list_splice(const struct list_head *list,
>> +				 struct list_head *prev,
>> +				 struct list_head *next)
>> +{
>> +	struct list_head *first = list->next;
>> +	struct list_head *last = list->prev;
>> +
>> +	first->prev = prev;
>> +	prev->next = first;
>> +
>> +	last->next = next;
>> +	next->prev = last;
>> +}
>> +
>> +/**
>> + * list_splice - join two lists, this is designed for stacks
>> + * @list: the new list to add.
>> + * @head: the place to add it in the first list.
>> + */
>> +static inline void list_splice(const struct list_head *list,
>> +				struct list_head *head)
>> +{
>> +	if (!list_empty(list))
>> +		__list_splice(list, head, head->next);
>> +}
>> +
>> +/**
>> + * list_splice_tail - join two lists, each list being a queue
>> + * @list: the new list to add.
>> + * @head: the place to add it in the first list.
>> + */
>> +static inline void list_splice_tail(struct list_head *list,
>> +				struct list_head *head)
>> +{
>> +	if (!list_empty(list))
>> +		__list_splice(list, head->prev, head);
>> +}
>> +
>> +/**
>> + * list_splice_init - join two lists and reinitialise the emptied list.
>> + * @list: the new list to add.
>> + * @head: the place to add it in the first list.
>> + *
>> + * The list at @list is reinitialised
>> + */
>> +static inline void list_splice_init(struct list_head *list,
>> +				    struct list_head *head)
>> +{
>> +	if (!list_empty(list)) {
>> +		__list_splice(list, head, head->next);
>> +		INIT_LIST_HEAD(list);
>> +	}
>> +}
>> +
>> +/**
>> + * list_splice_tail_init - join two lists and reinitialise the emptied list
>> + * @list: the new list to add.
>> + * @head: the place to add it in the first list.
>> + *
>> + * Each of the lists is a queue.
>> + * The list at @list is reinitialised
>> + */
>> +static inline void list_splice_tail_init(struct list_head *list,
>> +					 struct list_head *head)
>> +{
>> +	if (!list_empty(list)) {
>> +		__list_splice(list, head->prev, head);
>> +		INIT_LIST_HEAD(list);
>> +	}
>> +}
>> +
>> +/**
>> + * list_entry - get the struct for this entry
>> + * @ptr:	the &struct list_head pointer.
>> + * @type:	the type of the struct this is embedded in.
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_entry(ptr, type, member) \
>> +	container_of(ptr, type, member)
>> +
>> +/**
>> + * list_first_entry - get the first element from a list
>> + * @ptr:	the list head to take the element from.
>> + * @type:	the type of the struct this is embedded in.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Note, that list is expected to be not empty.
>> + */
>> +#define list_first_entry(ptr, type, member) \
>> +	list_entry((ptr)->next, type, member)
>> +
>> +/**
>> + * list_last_entry - get the last element from a list
>> + * @ptr:	the list head to take the element from.
>> + * @type:	the type of the struct this is embedded in.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Note, that list is expected to be not empty.
>> + */
>> +#define list_last_entry(ptr, type, member) \
>> +	list_entry((ptr)->prev, type, member)
>> +
>> +/**
>> + * list_first_entry_or_null - get the first element from a list
>> + * @ptr:	the list head to take the element from.
>> + * @type:	the type of the struct this is embedded in.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Note that if the list is empty, it returns NULL.
>> + */
>> +#define list_first_entry_or_null(ptr, type, member) \
>> +	(!list_empty(ptr) ? list_first_entry(ptr, type, member) : NULL)
>> +
>> +/**
>> + * list_next_entry - get the next element in list
>> + * @pos:	the type * to cursor
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_next_entry(pos, member) \
>> +	list_entry((pos)->member.next, typeof(*(pos)), member)
>> +
>> +/**
>> + * list_prev_entry - get the prev element in list
>> + * @pos:	the type * to cursor
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_prev_entry(pos, member) \
>> +	list_entry((pos)->member.prev, typeof(*(pos)), member)
>> +
>> +/**
>> + * list_for_each	-	iterate over a list
>> + * @pos:	the &struct list_head to use as a loop cursor.
>> + * @head:	the head for your list.
>> + */
>> +#define list_for_each(pos, head) \
>> +	for (pos = (head)->next; pos != (head); pos = pos->next)
>> +
>> +/**
>> + * list_for_each_prev	-	iterate over a list backwards
>> + * @pos:	the &struct list_head to use as a loop cursor.
>> + * @head:	the head for your list.
>> + */
>> +#define list_for_each_prev(pos, head) \
>> +	for (pos = (head)->prev; pos != (head); pos = pos->prev)
>> +
>> +/**
>> + * list_for_each_safe - iterate over a list safe against removal of list entry
>> + * @pos:	the &struct list_head to use as a loop cursor.
>> + * @n:		another &struct list_head to use as temporary storage
>> + * @head:	the head for your list.
>> + */
>> +#define list_for_each_safe(pos, n, head) \
>> +	for (pos = (head)->next, n = pos->next; pos != (head); \
>> +		pos = n, n = pos->next)
>> +
>> +/**
>> + * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
>> + * @pos:	the &struct list_head to use as a loop cursor.
>> + * @n:		another &struct list_head to use as temporary storage
>> + * @head:	the head for your list.
>> + */
>> +#define list_for_each_prev_safe(pos, n, head) \
>> +	for (pos = (head)->prev, n = pos->prev; \
>> +	     pos != (head); \
>> +	     pos = n, n = pos->prev)
>> +
>> +/**
>> + * list_for_each_entry	-	iterate over list of given type
>> + * @pos:	the type * to use as a loop cursor.
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_for_each_entry(pos, head, member)				\
>> +	for (pos = list_first_entry(head, typeof(*pos), member);	\
>> +	     &pos->member != (head);					\
>> +	     pos = list_next_entry(pos, member))
>> +
>> +/**
>> + * list_for_each_entry_reverse - iterate backwards over list of given type.
>> + * @pos:	the type * to use as a loop cursor.
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_for_each_entry_reverse(pos, head, member)			\
>> +	for (pos = list_last_entry(head, typeof(*pos), member);		\
>> +		&pos->member != (head); 					\
>> +		pos = list_prev_entry(pos, member))
>> +
>> +/**
>> + * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
>> + * @pos:	the type * to use as a start point
>> + * @head:	the head of the list
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
>> + */
>> +#define list_prepare_entry(pos, head, member) \
>> +	((pos) ? : list_entry(head, typeof(*pos), member))
>> +
>> +/**
>> + * list_for_each_entry_continue - continue iteration over list of given type
>> + * @pos:	the type * to use as a loop cursor.
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Continue to iterate over list of given type, continuing after
>> + * the current position.
>> + */
>> +#define list_for_each_entry_continue(pos, head, member) 		\
>> +	for (pos = list_next_entry(pos, member);			\
>> +		&pos->member != (head);					\
>> +		pos = list_next_entry(pos, member))
>> +
>> +/**
>> + * list_for_each_entry_continue_reverse - iterate backwards from the given point
>> + * @pos:	the type * to use as a loop cursor.
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Start to iterate over list of given type backwards, continuing after
>> + * the current position.
>> + */
>> +#define list_for_each_entry_continue_reverse(pos, head, member)		\
>> +	for (pos = list_prev_entry(pos, member);			\
>> +		&pos->member != (head);					\
>> +		pos = list_prev_entry(pos, member))
>> +
>> +/**
>> + * list_for_each_entry_from - iterate over list of given type from the current point
>> + * @pos:	the type * to use as a loop cursor.
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Iterate over list of given type, continuing from current position.
>> + */
>> +#define list_for_each_entry_from(pos, head, member) 			\
>> +	for (; &pos->member != (head);					\
>> +		pos = list_next_entry(pos, member))
>> +
>> +/**
>> + * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
>> + * @pos:	the type * to use as a loop cursor.
>> + * @n:		another type * to use as temporary storage
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + */
>> +#define list_for_each_entry_safe(pos, n, head, member)			\
>> +	for (pos = list_first_entry(head, typeof(*pos), member),	\
>> +		n = list_next_entry(pos, member);			\
>> +		&pos->member != (head); 					\
>> +		pos = n, n = list_next_entry(n, member))
>> +
>> +/**
>> + * list_for_each_entry_safe_continue - continue list iteration safe against removal
>> + * @pos:	the type * to use as a loop cursor.
>> + * @n:		another type * to use as temporary storage
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Iterate over list of given type, continuing after current point,
>> + * safe against removal of list entry.
>> + */
>> +#define list_for_each_entry_safe_continue(pos, n, head, member) 		\
>> +	for (pos = list_next_entry(pos, member), 				\
>> +		n = list_next_entry(pos, member);				\
>> +		&pos->member != (head);						\
>> +		pos = n, n = list_next_entry(n, member))
>> +
>> +/**
>> + * list_for_each_entry_safe_from - iterate over list from current point safe against removal
>> + * @pos:	the type * to use as a loop cursor.
>> + * @n:		another type * to use as temporary storage
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Iterate over list of given type from current point, safe against
>> + * removal of list entry.
>> + */
>> +#define list_for_each_entry_safe_from(pos, n, head, member) 			\
>> +	for (n = list_next_entry(pos, member);					\
>> +		&pos->member != (head);						\
>> +		pos = n, n = list_next_entry(n, member))
>> +
>> +/**
>> + * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
>> + * @pos:	the type * to use as a loop cursor.
>> + * @n:		another type * to use as temporary storage
>> + * @head:	the head for your list.
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * Iterate backwards over list of given type, safe against removal
>> + * of list entry.
>> + */
>> +#define list_for_each_entry_safe_reverse(pos, n, head, member)		\
>> +	for (pos = list_last_entry(head, typeof(*pos), member),		\
>> +		n = list_prev_entry(pos, member);			\
>> +		&pos->member != (head); 					\
>> +		pos = n, n = list_prev_entry(n, member))
>> +
>> +/**
>> + * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
>> + * @pos:	the loop cursor used in the list_for_each_entry_safe loop
>> + * @n:		temporary storage used in list_for_each_entry_safe
>> + * @member:	the name of the list_struct within the struct.
>> + *
>> + * list_safe_reset_next is not safe to use in general if the list may be
>> + * modified concurrently (eg. the lock is dropped in the loop body). An
>> + * exception to this is if the cursor element (pos) is pinned in the list,
>> + * and list_safe_reset_next is called after re-taking the lock and before
>> + * completing the current iteration of the loop body.
>> + */
>> +#define list_safe_reset_next(pos, n, member)				\
>> +	n = list_next_entry(pos, member)
>> +
>> +#endif
>> diff --git a/include/mtd/ubi-media.h b/include/mtd/ubi-media.h
>> index 08bec3e..ccd5b6e 100644
>> --- a/include/mtd/ubi-media.h
>> +++ b/include/mtd/ubi-media.h
>> @@ -312,6 +312,10 @@ struct ubi_vid_hdr {
>>   #define UBI_LAYOUT_VOLUME_NAME   "layout volume"
>>   #define UBI_LAYOUT_VOLUME_COMPAT UBI_COMPAT_REJECT
>>
>> +/* UBI fastmap on-flash data structures */
>> +#define UBI_FM_SB_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 1)
>> +#define UBI_FM_DATA_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 2)
>> +
>>   /* The maximum number of volumes per one UBI device */
>>   #define UBI_MAX_VOLUMES 128
>>
>> diff --git a/ubi-utils/include/libubigen.h b/ubi-utils/include/libubigen.h
>> index c25ac20..f7d7212 100644
>> --- a/ubi-utils/include/libubigen.h
>> +++ b/ubi-utils/include/libubigen.h
>> @@ -27,6 +27,7 @@
>>
>>   #include <stdint.h>
>>   #include <mtd/ubi-media.h>
>> +#include <linux/list.h>
>>
>>   #ifdef __cplusplus
>>   extern "C" {
>> @@ -43,6 +44,7 @@ extern "C" {
>>    * @vtbl_size: volume table size
>>    * @max_volumes: maximum amount of volumes
>>    * @image_seq: UBI image sequence number
>> + * @max_leb_count: maximum logical erase block count
>>    */
>>   struct ubigen_info
>>   {
>> @@ -55,6 +57,7 @@ struct ubigen_info
>>   	int vtbl_size;
>>   	int max_volumes;
>>   	uint32_t image_seq;
>> +	uint32_t max_leb_count;
>>   };
>>
>>   /**
>> @@ -74,6 +77,9 @@ struct ubigen_info
>>    * @bytes: size of the volume contents in bytes (relevant for static volumes
>>    *         only)
>>    * @flags: volume flags (%UBI_VTBL_AUTORESIZE_FLG)
>> + * @pebs: array of PEBs assigned to the volume luns. Index of the array
>> + *         is the lun
>> + * @reserved_pebs: number of PEBs required for this volume
>>    */
>>   struct ubigen_vol_info
>>   {
>> @@ -88,6 +94,8 @@ struct ubigen_vol_info
>>   	int used_ebs;
>>   	long long bytes;
>>   	uint8_t flags;
>> +	int *pebs;
>> +	int reserved_pebs;
>>   };
>>
>>   /**
>> @@ -100,10 +108,11 @@ struct ubigen_vol_info
>>    * @vid_hdr_offs: offset of the VID header
>>    * @ubi_ver: UBI version
>>    * @image_seq: UBI image sequence number
>> + * @max_leb_count: maximum logical erase block count
>>    */
>>   void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
>>   		      int subpage_size, int vid_hdr_offs, int ubi_ver,
>> -		      uint32_t image_seq);
>> +		      uint32_t image_seq, int max_leb_count);
>>
>>   /**
>>    * ubigen_create_empty_vtbl - creates empty volume table.
>> @@ -151,7 +160,7 @@ void ubigen_init_vid_hdr(const struct ubigen_info *ui,
>>    * @vtbl.
>>    */
>>   int ubigen_add_volume(const struct ubigen_info *ui,
>> -		      const struct ubigen_vol_info *vi,
>> +		      struct ubigen_vol_info *vi,
>>   		      struct ubi_vtbl_record *vtbl);
>>
>>   /**
>> @@ -162,14 +171,18 @@ int ubigen_add_volume(const struct ubigen_info *ui,
>>    * @bytes: volume size in bytes
>>    * @in: input file descriptor (has to be properly seeked)
>>    * @out: output file descriptor
>> + * @used: linked list of used PEBs for writing the volume.
>> + *      To be filled in by this function
>> + * @used_cnt: number of PEBs used to write this volume
>>    *
>>    * This function reads the contents of the volume from the input file @in and
>>    * writes the UBI volume to the output file @out. Returns zero on success and
>>    * %-1 on failure.
>>    */
>>   int ubigen_write_volume(const struct ubigen_info *ui,
>> -			const struct ubigen_vol_info *vi, long long ec,
>> -			long long bytes, int in, int out);
>> +		struct ubigen_vol_info *vi, long long ec,
>> +		long long bytes, int in, int out, struct list_head *used,
>> +		int *used_cnt);
>>
>>   /**
>>    * ubigen_write_layout_vol - write UBI layout volume
>> @@ -180,13 +193,15 @@ int ubigen_write_volume(const struct ubigen_info *ui,
>>    * @ec2: erase counter value for @peb1
>>    * @vtbl: volume table
>>    * @fd: output file descriptor seeked to the proper position
>> + * @vi_layout: information about the layout volume
>>    *
>>    * This function creates the UBI layout volume which contains 2 copies of the
>>    * volume table. Returns zero in case of success and %-1 in case of failure.
>>    */
>>   int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
>>   			    long long ec1, long long ec2,
>> -			    struct ubi_vtbl_record *vtbl, int fd);
>> +			    struct ubi_vtbl_record *vtbl, int fd,
>> +			    struct ubigen_vol_info *vi_layout);
>>
>>   #ifdef __cplusplus
>>   }
>> diff --git a/ubi-utils/include/ubi-fastmap.h b/ubi-utils/include/ubi-fastmap.h
>> new file mode 100644
>> index 0000000..3947eef
>> --- /dev/null
>> +++ b/ubi-utils/include/ubi-fastmap.h
>> @@ -0,0 +1,217 @@
>> +/*
>> + * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * Copyright (c) International Business Machines Corp., 2006
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>> + * the GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> + *
>> + * Authors: Artem Bityutskiy (Битюцкий Артём)
>> + *          Thomas Gleixner
>> + *          Frank Haverkamp
>> + *          Oliver Lohmann
>> + *          Andreas Arnez
>> + */
>> +
>> +#ifndef __UBI_FASTMAP_H__
>> +#define __UBI_FASTMAP_H__
>> +
>> +#ifdef __cplusplus
>> +extern "C" {
>> +#endif
>> +
>> +#include <asm/byteorder.h>
>> +#include <libubigen.h>
>> +#include <linux/list.h>
>> +
>> +/* A fastmap can use up to UBI_FM_MAX_BLOCKS PEBs */
>> +#define UBI_FM_MAX_BLOCKS	32
>> +
>> +/* fastmap on-flash data structure format version */
>> +#define UBI_FM_FMT_VERSION	1
>> +
>> +#define UBI_FM_SB_MAGIC		0x7B11D69F
>> +#define UBI_FM_HDR_MAGIC	0xD4B82EF7
>> +#define UBI_FM_VHDR_MAGIC	0xFA370ED1
>> +#define UBI_FM_POOL_MAGIC	0x67AF4D08
>> +#define UBI_FM_EBA_MAGIC	0xf0c040a8
>> +
>> +/**
>> + * struct ubi_fm_sb - UBI fastmap super block
>> + * @magic: fastmap super block magic number (%UBI_FM_SB_MAGIC)
>> + * @version: format version of this fastmap
>> + * @data_crc: CRC over the fastmap data
>> + * @used_blocks: number of PEBs used by this fastmap
>> + * @block_loc: an array containing the location of all PEBs of the fastmap
>> + * @block_ec: the erase counter of each used PEB
>> + * @sqnum: highest sequence number value at the time while taking the fastmap
>> + *
>> + */
>> +struct ubi_fm_sb {
>> +	__be32 magic;
>> +	__u8 version;
>> +	__u8 padding1[3];
>> +	__be32 data_crc;
>> +	__be32 used_blocks;
>> +	__be32 block_loc[UBI_FM_MAX_BLOCKS];
>> +	__be32 block_ec[UBI_FM_MAX_BLOCKS];
>> +	__be64 sqnum;
>> +	__u8 padding2[32];
>> +}  __attribute__ ((packed));
>> +
>> +/**
>> + * struct ubi_fm_hdr - header of the fastmap data set
>> + * @magic: fastmap header magic number (%UBI_FM_HDR_MAGIC)
>> + * @free_peb_count: number of free PEBs known by this fastmap
>> + * @used_peb_count: number of used PEBs known by this fastmap
>> + * @scrub_peb_count: number of to be scrubbed PEBs known by this fastmap
>> + * @bad_peb_count: number of bad PEBs known by this fastmap
>> + * @erase_peb_count: number of bad PEBs which have to be erased
>> + * @vol_count: number of UBI volumes known by this fastmap
>> + */
>> +struct ubi_fm_hdr {
>> +	__be32 magic;
>> +	__be32 free_peb_count;
>> +	__be32 used_peb_count;
>> +	__be32 scrub_peb_count;
>> +	__be32 bad_peb_count;
>> +	__be32 erase_peb_count;
>> +	__be32 vol_count;
>> +	__u8 padding[4];
>> +}  __attribute__ ((packed));
>> +
>> +/* struct ubi_fm_hdr is followed by two struct ubi_fm_scan_pool */
>> +
>> +/*
>> + * 5% of the total number of PEBs have to be scanned while attaching
>> + * from a fastmap.
>> + * But the size of this pool is limited to be between UBI_FM_MIN_POOL_SIZE and
>> + * UBI_FM_MAX_POOL_SIZE
>> + */
>> +#define UBI_FM_MIN_POOL_SIZE	8
>> +#define UBI_FM_MAX_POOL_SIZE	256
>> +
>> +#define UBI_FM_WL_POOL_SIZE	25
>> +
>> +/**
>> + * struct ubi_fm_scan_pool - Fastmap pool PEBs to be scanned while attaching
>> + * @magic: pool magic numer (%UBI_FM_POOL_MAGIC)
>> + * @size: current pool size
>> + * @max_size: maximal pool size
>> + * @pebs: an array containing the location of all PEBs in this pool
>> + */
>> +struct ubi_fm_scan_pool {
>> +	__be32 magic;
>> +	__be16 size;
>> +	__be16 max_size;
>> +	__be32 pebs[UBI_FM_MAX_POOL_SIZE];
>> +	__be32 padding[4];
>> +}  __attribute__ ((packed));
>> +
>> +/* ubi_fm_scan_pool is followed by nfree+nused struct ubi_fm_ec records */
>> +
>> +/**
>> + * struct ubi_fm_ec - stores the erase counter of a PEB
>> + * @pnum: PEB number
>> + * @ec: ec of this PEB
>> + */
>> +struct ubi_fm_ec {
>> +	__be32 pnum;
>> +	__be32 ec;
>> +}  __attribute__ ((packed));
>> +
>> +/**
>> + * struct ubi_wl_peb - in-memory representation of a used PEB
>> + * @pnum: PEB number
>> + * @ec: ec of this PEB
>> + * @used: link to the used list
>> + */
>> +struct ubi_wl_peb {
>> +	int pnum;
>> +	int ec;
>> +	struct list_head list;
>> +};
>> +
>> +/**
>> + * struct ubi_fastmap_layout - in-memory fastmap data structure.
>> + * @e: PEBs used by the current fastmap
>> + * @to_be_tortured: if non-zero tortured this PEB
>> + * @used_blocks: number of used PEBs
>> + * @max_pool_size: maximal size of the user pool
>> + * @max_wl_pool_size: maximal size of the pool used by the WL sub-system
>> + */
>> +struct ubi_fastmap_layout {
>> +	struct ubi_wl_peb e[UBI_FM_MAX_BLOCKS];
>> +	int used_blocks;
>> +	int max_pool_size;
>> +	int max_wl_pool_size;
>> +};
>> +
>> +/**
>> + * struct ubi_fm_volhdr - Fastmap volume header
>> + * it identifies the start of an eba table
>> + * @magic: Fastmap volume header magic number (%UBI_FM_VHDR_MAGIC)
>> + * @vol_id: volume id of the fastmapped volume
>> + * @vol_type: type of the fastmapped volume
>> + * @data_pad: data_pad value of the fastmapped volume
>> + * @used_ebs: number of used LEBs within this volume
>> + * @last_eb_bytes: number of bytes used in the last LEB
>> + */
>> +struct ubi_fm_volhdr {
>> +	__be32 magic;
>> +	__be32 vol_id;
>> +	__u8 vol_type;
>> +	__u8 padding1[3];
>> +	__be32 data_pad;
>> +	__be32 used_ebs;
>> +	__be32 last_eb_bytes;
>> +	__u8 padding2[8];
>> +}  __attribute__ ((packed));
>> +
>> +/* struct ubi_fm_volhdr is followed by one struct ubi_fm_eba records */
>> +
>> +/**
>> + * struct ubi_fm_eba - denotes an association beween a PEB and LEB
>> + * @magic: EBA table magic number
>> + * @reserved_pebs: number of table entries
>> + * @pnum: PEB number of LEB (LEB is the index)
>> + */
>> +struct ubi_fm_eba {
>> +	__be32 magic;
>> +	__be32 reserved_pebs;
>> +	__be32 pnum[0];
>> +}  __attribute__ ((packed));
>> +
>> +void dump_fs_data(struct list_head *used, int used_cnt,
>> +		struct ubigen_vol_info *vi, int nsects, int peb_cnt);
>> +
>> +int add_fastmap_data(struct ubigen_info *ui, int anchor_peb,
>> +		int fs_start_peb, int ec, struct list_head *used,
>> +		struct ubigen_vol_info *vi, int nsects, int out);
>> +
>> +#ifdef __cplusplus
>> +}
>> +#endif
>> +
>> +#endif /* !__UBI_FASTMAP_H__ */
>> +
>> diff --git a/ubi-utils/libubigen.c b/ubi-utils/libubigen.c
>> index d2a949b..7500334 100644
>> --- a/ubi-utils/libubigen.c
>> +++ b/ubi-utils/libubigen.c
>> @@ -36,10 +36,11 @@
>>   #include <libubigen.h>
>>   #include <crc32.h>
>>   #include "common.h"
>> +#include "include/ubi-fastmap.h"
>>
>>   void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
>>   		      int subpage_size, int vid_hdr_offs, int ubi_ver,
>> -		      uint32_t image_seq)
>> +		      uint32_t image_seq, int max_leb_count)
>>   {
>>   	if (!vid_hdr_offs) {
>>   		vid_hdr_offs = UBI_EC_HDR_SIZE + subpage_size - 1;
>> @@ -61,6 +62,7 @@ void ubigen_info_init(struct ubigen_info *ui, int peb_size, int min_io_size,
>>   	if (ui->max_volumes > UBI_MAX_VOLUMES)
>>   		ui->max_volumes = UBI_MAX_VOLUMES;
>>   	ui->vtbl_size = ui->max_volumes * UBI_VTBL_RECORD_SIZE;
>> +	ui->max_leb_count = (max_leb_count > 0 ? max_leb_count : 0);
>>   }
>>
>>   struct ubi_vtbl_record *ubigen_create_empty_vtbl(const struct ubigen_info *ui)
>> @@ -84,7 +86,7 @@ struct ubi_vtbl_record *ubigen_create_empty_vtbl(const struct ubigen_info *ui)
>>   }
>>
>>   int ubigen_add_volume(const struct ubigen_info *ui,
>> -		      const struct ubigen_vol_info *vi,
>> +		      struct ubigen_vol_info *vi,
>>   		      struct ubi_vtbl_record *vtbl)
>>   {
>>   	struct ubi_vtbl_record *vtbl_rec = &vtbl[vi->id];
>> @@ -103,7 +105,6 @@ int ubigen_add_volume(const struct ubigen_info *ui,
>>   		errno = EINVAL;
>>   		return -1;
>>   	}
>> -
>>   	memset(vtbl_rec, 0, sizeof(struct ubi_vtbl_record));
>>   	tmp = (vi->bytes + ui->leb_size - 1) / ui->leb_size;
>>   	vtbl_rec->reserved_pebs = cpu_to_be32(tmp);
>> @@ -119,6 +120,7 @@ int ubigen_add_volume(const struct ubigen_info *ui,
>>
>>   	tmp = mtd_crc32(UBI_CRC32_INIT, vtbl_rec, UBI_VTBL_RECORD_SIZE_CRC);
>>   	vtbl_rec->crc =	 cpu_to_be32(tmp);
>> +	vi->reserved_pebs = 0;
>>   	return 0;
>>   }
>>
>> @@ -169,11 +171,13 @@ void ubigen_init_vid_hdr(const struct ubigen_info *ui,
>>   }
>>
>>   int ubigen_write_volume(const struct ubigen_info *ui,
>> -			const struct ubigen_vol_info *vi, long long ec,
>> -			long long bytes, int in, int out)
>> +			struct ubigen_vol_info *vi, long long ec,
>> +			long long bytes, int in, int out, struct list_head *used,
>> +			int *used_cnt)
>>   {
>>   	int len = vi->usable_leb_size, rd, lnum = 0;
>>   	char *inbuf, *outbuf;
>> +	struct ubi_wl_peb *new_peb;
>>
>>   	if (vi->id >= ui->max_volumes) {
>>   		errmsg("too high volume id %d, max. volumes is %d",
>> @@ -228,6 +232,17 @@ int ubigen_write_volume(const struct ubigen_info *ui,
>>   		memset(outbuf + ui->data_offs + len, 0xFF,
>>   		       ui->peb_size - ui->data_offs - len);
>>
>> +		new_peb = malloc(sizeof(*new_peb));
>> +		if (!new_peb) {
>> +			sys_errmsg("mem allocation failed");
>> +			goto out_free1;
>> +		}
>> +		new_peb->pnum = (*used_cnt)++;
>> +		new_peb->ec = ec;
>> +		list_add_tail(&new_peb->list, used);
>> +		if (vi->pebs)
>> +			vi->pebs[lnum] = new_peb->pnum;
>> +		vi->reserved_pebs++;
>>   		if (write(out, outbuf, ui->peb_size) != ui->peb_size) {
>>   			sys_errmsg("cannot write %d bytes to the output file", ui->peb_size);
>>   			goto out_free1;
>> @@ -235,7 +250,6 @@ int ubigen_write_volume(const struct ubigen_info *ui,
>>
>>   		lnum += 1;
>>   	}
>> -
>>   	free(outbuf);
>>   	free(inbuf);
>>   	return 0;
>> @@ -249,29 +263,41 @@ out_free:
>>
>>   int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
>>   			    long long ec1, long long ec2,
>> -			    struct ubi_vtbl_record *vtbl, int fd)
>> +			    struct ubi_vtbl_record *vtbl, int fd,
>> +			    struct ubigen_vol_info *vi_layout)
>>   {
>>   	int ret;
>> -	struct ubigen_vol_info vi;
>> +	struct ubigen_vol_info *vi;
>>   	char *outbuf;
>>   	struct ubi_vid_hdr *vid_hdr;
>>   	off_t seek;
>>
>> -	vi.bytes = ui->leb_size * UBI_LAYOUT_VOLUME_EBS;
>> -	vi.id = UBI_LAYOUT_VOLUME_ID;
>> -	vi.alignment = UBI_LAYOUT_VOLUME_ALIGN;
>> -	vi.data_pad = ui->leb_size % UBI_LAYOUT_VOLUME_ALIGN;
>> -	vi.usable_leb_size = ui->leb_size - vi.data_pad;
>> -	vi.data_pad = ui->leb_size - vi.usable_leb_size;
>> -	vi.type = UBI_LAYOUT_VOLUME_TYPE;
>> -	vi.name = UBI_LAYOUT_VOLUME_NAME;
>> -	vi.name_len = strlen(UBI_LAYOUT_VOLUME_NAME);
>> -	vi.compat = UBI_LAYOUT_VOLUME_COMPAT;
>> +	if (vi_layout) {
>> +		vi = vi_layout;
>> +	} else {
>> +		vi = malloc(sizeof(*vi));
>> +		if (!vi)
>> +			return sys_errmsg("failed to allocate %lu bytes",
>> +					sizeof(*vi));
>> +	}
>> +	vi->bytes = ui->leb_size * UBI_LAYOUT_VOLUME_EBS;
>> +	vi->id = UBI_LAYOUT_VOLUME_ID;
>> +	vi->alignment = UBI_LAYOUT_VOLUME_ALIGN;
>> +	vi->data_pad = ui->leb_size % UBI_LAYOUT_VOLUME_ALIGN;
>> +	vi->usable_leb_size = ui->leb_size - vi->data_pad;
>> +	vi->data_pad = ui->leb_size - vi->usable_leb_size;
>> +	vi->type = UBI_LAYOUT_VOLUME_TYPE;
>> +	vi->name = UBI_LAYOUT_VOLUME_NAME;
>> +	vi->name_len = strlen(UBI_LAYOUT_VOLUME_NAME);
>> +	vi->compat = UBI_LAYOUT_VOLUME_COMPAT;
>>
>>   	outbuf = malloc(ui->peb_size);
>> -	if (!outbuf)
>> +	if (!outbuf) {
>> +		if (!vi_layout)
>> +			free(vi);
>>   		return sys_errmsg("failed to allocate %d bytes",
>>   				  ui->peb_size);
>> +	}
>>
>>   	memset(outbuf, 0xFF, ui->data_offs);
>>   	vid_hdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
>> @@ -282,34 +308,38 @@ int ubigen_write_layout_vol(const struct ubigen_info *ui, int peb1, int peb2,
>>   	seek = (off_t) peb1 * ui->peb_size;
>>   	if (lseek(fd, seek, SEEK_SET) != seek) {
>>   		sys_errmsg("cannot seek output file");
>> +		ret = -1;
>>   		goto out_free;
>>   	}
>>
>>   	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec1);
>> -	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 0, NULL, 0);
>> +	ubigen_init_vid_hdr(ui, vi, vid_hdr, 0, NULL, 0);
>>   	ret = write(fd, outbuf, ui->peb_size);
>>   	if (ret != ui->peb_size) {
>>   		sys_errmsg("cannot write %d bytes", ui->peb_size);
>> +		ret = -1;
>>   		goto out_free;
>>   	}
>>
>>   	seek = (off_t) peb2 * ui->peb_size;
>>   	if (lseek(fd, seek, SEEK_SET) != seek) {
>>   		sys_errmsg("cannot seek output file");
>> +		ret = -1;
>>   		goto out_free;
>>   	}
>>   	ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf, ec2);
>> -	ubigen_init_vid_hdr(ui, &vi, vid_hdr, 1, NULL, 0);
>> +	ubigen_init_vid_hdr(ui, vi, vid_hdr, 1, NULL, 0);
>>   	ret = write(fd, outbuf, ui->peb_size);
>>   	if (ret != ui->peb_size) {
>>   		sys_errmsg("cannot write %d bytes", ui->peb_size);
>> +		ret = -1;
>>   		goto out_free;
>>   	}
>>
>> -	free(outbuf);
>> -	return 0;
>> -
>> +	ret = 0;
>>   out_free:
>> +	if (!vi_layout)
>> +		free(vi);
>>   	free(outbuf);
>> -	return -1;
>> +	return ret;
>>   }
>> diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
>> index a86abd1..7c5c21c 100644
>> --- a/ubi-utils/mtdinfo.c
>> +++ b/ubi-utils/mtdinfo.c
>> @@ -168,7 +168,7 @@ static void print_ubi_info(const struct mtd_info *mtd_info,
>>   	}
>>
>>   	ubigen_info_init(&ui, mtd->eb_size, mtd->min_io_size, mtd->subpage_size,
>> -			 0, 1, 0);
>> +			 0, 1, 0, 0);
>>   	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
>>   	printf("Default UBI data offset:        %d\n", ui.data_offs);
>>   	printf("Default UBI LEB size:           ");
>> diff --git a/ubi-utils/ubi-fastmap.c b/ubi-utils/ubi-fastmap.c
>> new file mode 100644
>> index 0000000..a824dba
>> --- /dev/null
>> +++ b/ubi-utils/ubi-fastmap.c
>> @@ -0,0 +1,358 @@
>> +/*
>> + * Copyright (c) 2014-2015, Linux Foundation.  All Rights Reserved.
>> + *
>> + * Copyright (c) 2012 Linutronix GmbH
>> + * Author: Richard Weinberger <richard@nod.at>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; version 2.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
>> + * the GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#define PROGRAM_NAME	"ubi-fastmap"
>> +
>> +#include <sys/stat.h>
>> +#include <stdlib.h>
>> +#include <stdint.h>
>> +#include <unistd.h>
>> +#include <getopt.h>
>> +#include <string.h>
>> +#include <fcntl.h>
>> +#include <mtd_swab.h>
>> +#include <crc32.h>
>> +
>> +#include <mtd/ubi-media.h>
>> +#include <mtd/ubi-user.h>
>> +#include <libubigen.h>
>> +#include "common.h"
>> +#include "ubiutils-common.h"
>> +
>> +#include <linux/list.h>
>> +
>> +#include "include/ubi-fastmap.h"
>> +
>> +/* Used only for dbg. Will be removed later. */
>> +void dbg_dump_fs_data(struct list_head *used, int used_cnt,
>> +		struct ubigen_vol_info *vi, int nsects, int peb_cnt)
>> +{
>> +	int i, j;
>> +	struct ubi_wl_peb *peb;
>> +	printf("--------------Collected FM data-----------------\n");
>> +	printf("Used lst (cnt = %d)\n", used_cnt);
>> +	list_for_each_entry(peb, used, list)
>> +		printf("[%d,%d], ", peb->pnum, peb->ec);
>> +	printf("\n\nGo Over volumes (nsects = %d)", nsects);
>> +	for (i = 0; i < nsects; i++){
>> +		printf("\nVol-%d:\n", vi[i].id);
>> +		for (j = 0; j < peb_cnt; j++)
>> +			if (vi[i].pebs && vi[i].pebs[j] != -1)
>> +				printf("[%d,%d], ", j, vi[i].pebs[j]);
>> +	}
>> +	printf("\n");
>> +}
>> +
>> +#define roundup(x, y) (					\
>> +{							\
>> +	const typeof(y) __y = y;			\
>> +	(((x) + (__y - 1)) / __y) * __y;		\
>> +}							\
>> +)
>> +
>> +/**
>> + * ubi_calc_fm_size - calculates the fastmap size in bytes
>> + * @ui: libubigen information (device description object)
>> + *
>> + * The calculated size is rounded up to LEB size.
>> + */
>> +static size_t ubi_calc_fm_size(struct ubigen_info *ui)
>> +{
>> +	size_t size;
>> +
>> +	size = sizeof(struct ubi_fm_sb) + \
>> +		sizeof(struct ubi_fm_hdr) + \
>> +		sizeof(struct ubi_fm_scan_pool) + \
>> +		sizeof(struct ubi_fm_scan_pool) + \
>> +		(ui->max_leb_count * sizeof(struct ubi_fm_ec)) + \
>> +		(sizeof(struct ubi_fm_eba) + \
>> +		(ui->max_leb_count * sizeof(__be32))) + \
>> +		sizeof(struct ubi_fm_volhdr) * UBI_MAX_VOLUMES;
>> +	return roundup(size, ui->leb_size);
>> +}
>> +
>> +static void init_vid_hdr(const struct ubigen_info *ui,
>> +			 struct ubi_vid_hdr *hdr, uint32_t vol_id)
>> +{
>> +	uint32_t crc;
>> +
>> +	hdr->vol_type = UBI_VID_DYNAMIC;
>> +	hdr->vol_id = cpu_to_be32(vol_id);
>> +	hdr->compat = UBI_COMPAT_DELETE;
>> +	hdr->magic = cpu_to_be32(UBI_VID_HDR_MAGIC);
>> +	hdr->version = ui->ubi_ver;
>> +
>> +	crc = mtd_crc32(UBI_CRC32_INIT, hdr, UBI_VID_HDR_SIZE_CRC);
>> +	hdr->hdr_crc = cpu_to_be32(crc);
>> +}
>> +
>> +static int write_new_fm_to_file(struct ubigen_info *ui,
>> +		struct ubi_fastmap_layout *new_fm,
>> +		void *fm_raw, int fm_size, int out)
>> +{
>> +	struct ubi_vid_hdr *avhdr;
>> +	char *outbuf;
>> +	int ret, i;
>> +
>> +	outbuf = malloc(ui->peb_size);
>> +	if (!outbuf) {
>> +		sys_errmsg("cannot allocate %d bytes of memory", ui->peb_size);
>> +		ret = -ENOMEM;
>> +		goto out_free;
>> +	}
>> +
>> +	avhdr = (struct ubi_vid_hdr *)(&outbuf[ui->vid_hdr_offs]);
>> +	for (i = 0; i < new_fm->used_blocks; i++) {
>> +		memset(outbuf, 0xFF, ui->data_offs);
>> +		ubigen_init_ec_hdr(ui, (struct ubi_ec_hdr *)outbuf,
>> +				new_fm->e[0].ec);
>> +
>> +		memset(avhdr, 0, sizeof(struct ubi_vid_hdr));
>> +		avhdr->sqnum = cpu_to_be32(1);
>> +		avhdr->lnum = cpu_to_be32(i);
>> +		init_vid_hdr(ui, avhdr, UBI_FM_SB_VOLUME_ID);
>> +
>> +		if (i * ui->leb_size > fm_size) {
>> +			sys_errmsg("memory leak!");
>> +			ret = -ENOMEM;
>> +			goto out_free;
>> +		}
>> +		memcpy(outbuf + ui->data_offs,
>> +				fm_raw + i * ui->leb_size, ui->leb_size);
>> +
>> +		if (lseek(out, (off_t)(new_fm->e[i].pnum * ui->peb_size),
>> +				SEEK_SET) != (off_t)(new_fm->e[i].pnum * ui->peb_size)) {
>> +			sys_errmsg("cannot seek output file");
>> +			ret = -EPERM;
>> +			goto out_free;
>> +		}
>> +		if (write(out, outbuf, ui->peb_size) != ui->peb_size) {
>> +			sys_errmsg("cannot write %d bytes to the output file",
>> +					ui->peb_size);
>> +			ret = -EPERM;
>> +			goto out_free;
>> +		}
>> +	}
>> +	ret = 0;
>> +
>> +out_free:
>> +	free(outbuf);
>> +	return ret;
>> +}
>> +
>> +static void *generate_fm_raw_data(struct ubigen_info *ui, int fm_size,
>> +		struct list_head *used, int fs_start_peb, int ec,
>> +		struct ubigen_vol_info *vi, int nsects)
>> +{
>> +	size_t fm_pos = 0;
>> +	void *fm_raw;
>> +	struct ubi_fm_sb *fmsb;
>> +	struct ubi_fm_hdr *fmh;
>> +	struct ubi_fm_scan_pool *fmpl1, *fmpl2;
>> +	struct ubi_fm_ec *fec;
>> +	struct ubi_fm_volhdr *fvh;
>> +	struct ubi_fm_eba *feba;
>> +	int i, j, free_peb_count, used_peb_count, vol_count;
>> +	int max_pool_size;
>> +	struct ubi_wl_peb *used_peb;
>> +
>> +	fm_raw = malloc(fm_size);
>> +	if (!fm_raw)
>> +		return NULL;
>> +
>> +	memset(fm_raw, 0, fm_size);
>> +	fmsb = (struct ubi_fm_sb *)fm_raw;
>> +	fm_pos += sizeof(*fmsb);
>> +	if (fm_pos > fm_size)
>> +		goto out_free;
>> +
>> +	fmh = (struct ubi_fm_hdr *)(fm_raw + fm_pos);
>> +	fm_pos += sizeof(*fmh);
>> +	if (fm_pos > fm_size)
>> +			goto out_free;
>> +
>> +	fmsb->magic = cpu_to_be32(UBI_FM_SB_MAGIC);
>> +	fmsb->version = UBI_FM_FMT_VERSION;
>> +	fmsb->used_blocks = cpu_to_be32(fm_size / ui->leb_size);
>> +	/* the max sqnum will be filled in while *reading* the fastmap */
>> +	fmsb->sqnum = cpu_to_be32(1);
>> +
>> +	fmh->magic = cpu_to_be32(UBI_FM_HDR_MAGIC);
>> +	free_peb_count = 0;
>> +	used_peb_count = 0;
>> +	vol_count = 0;
>> +
>> +	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
>> +	fm_pos += sizeof(*fmpl1);
>> +	fmpl1->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
>> +	fmpl1->size = 0;
>> +	/*
>> +	 * fm_pool.max_size is 5% of the total number of PEBs but it's also
>> +	 * between UBI_FM_MAX_POOL_SIZE and UBI_FM_MIN_POOL_SIZE.
>> +	 */
>> +	max_pool_size = min((ui->max_leb_count / 100) * 5,
>> +						UBI_FM_MAX_POOL_SIZE);
>> +	if (max_pool_size < UBI_FM_MIN_POOL_SIZE)
>> +		max_pool_size = UBI_FM_MIN_POOL_SIZE;
>> +
>> +	fmpl1->max_size = cpu_to_be16(max_pool_size);
>> +
>> +	fmpl2 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
>> +	fm_pos += sizeof(*fmpl2);
>> +	fmpl2->magic = cpu_to_be32(UBI_FM_POOL_MAGIC);
>> +	fmpl2->size = 0;
>> +	fmpl2->max_size = cpu_to_be16(UBI_FM_WL_POOL_SIZE);
>> +
>> +	/* free list */
>> +	for (i = fs_start_peb + fm_size / ui->leb_size;
>> +			i < ui->max_leb_count; i++) {
>> +		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
>> +		fec->pnum = cpu_to_be32(i);
>> +		fec->ec = cpu_to_be32(ec);
>> +		free_peb_count++;
>> +		fm_pos += sizeof(*fec);
>> +		if (fm_pos > fm_size)
>> +			goto out_free;
>> +	}
>> +	fmh->free_peb_count = cpu_to_be32(free_peb_count);
>> +	/* go over used */
>> +	list_for_each_entry(used_peb, used, list) {
>> +		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
>> +		fec->pnum = cpu_to_be32(used_peb->pnum);
>> +		fec->ec = cpu_to_be32(used_peb->ec);
>> +		used_peb_count++;
>> +		fm_pos += sizeof(*fec);
>> +		if (fm_pos > fm_size)
>> +			goto out_free;
>> +	}
>> +	fmh->used_peb_count = cpu_to_be32(used_peb_count);
>> +
>> +	fmh->scrub_peb_count = 0;
>> +	fmh->erase_peb_count = 0;
>> +
>> +	/* Go over all the volumes */
>> +	for (i = 0; i < nsects; i++) {
>> +		vol_count++;
>> +		fvh = (struct ubi_fm_volhdr *)(fm_raw + fm_pos);
>> +		fm_pos += sizeof(*fvh);
>> +		if (fm_pos > fm_size)
>> +			goto out_free;
>> +
>> +		fvh->magic = cpu_to_be32(UBI_FM_VHDR_MAGIC);
>> +		fvh->vol_id = cpu_to_be32(vi[i].id);
>> +		if (vi[i].type != UBI_VID_DYNAMIC &&
>> +				vi[i].type != UBI_VID_STATIC)
>> +			goto out_free;
>> +
>> +		fvh->vol_type = (vi[i].type == UBI_VID_DYNAMIC ?
>> +				UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME);
>> +		fvh->used_ebs = cpu_to_be32(vi[i].used_ebs);
>> +		fvh->data_pad = cpu_to_be32(vi[i].data_pad);
>> +		fvh->last_eb_bytes = cpu_to_be32(vi[i].usable_leb_size);
>> +
>> +		feba = (struct ubi_fm_eba *)(fm_raw + fm_pos);
>> +		fm_pos += sizeof(*feba) +
>> +				(sizeof(__be32) * vi[i].reserved_pebs);
>> +		if (fm_pos > fm_size)
>> +			goto out_free;
>> +
>> +		if (!vi[i].pebs)
>> +			goto out_free;
>> +		for (j = 0; j < vi[i].reserved_pebs; j++)
>> +			feba->pnum[j] = cpu_to_be32(vi[i].pebs[j]);
>> +
>> +		feba->reserved_pebs = cpu_to_be32(j);
>> +		feba->magic = cpu_to_be32(UBI_FM_EBA_MAGIC);
>> +	}
>> +	fmh->vol_count = cpu_to_be32(vol_count);
>> +	fmh->bad_peb_count = 0;
>> +
>> +	return fm_raw;
>> +
>> +out_free:
>> +	free(fm_raw);
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * add_fastmap_data - Adds fastmap data to the generated image file
>> + * @ui: UBI device description object
>> + * @anchor_peb: number of PEB to write the fastmap anchor to
>> + * @fs_start_peb: number of the first free PEB that can be used
>> + * 		for fastmap data
>> + * @ec: erase counter value to set for fastmap PEBs
>> + * @used: list of used PEBs
>> + * @vi: Volumes info
>> + * @nsects: number of volumes at @vi
>> + * @out: output image file handler
>> + *
>> + * Returns 0 on success, < 0 indicates an internal error.
>> + */
>> +int add_fastmap_data(struct ubigen_info *ui, int anchor_peb,
>> +		int fs_start_peb, int ec, struct list_head *used,
>> +		struct ubigen_vol_info *vi, int nsects, int out)
>> +{
>> +	void *fm_raw = NULL;
>> +	struct ubi_fastmap_layout *new_fm;
>> +	int ret, i;
>> +	int fm_size = ubi_calc_fm_size(ui);
>> +	struct ubi_fm_sb *fmsb;
>> +
>> +	new_fm = malloc(sizeof(*new_fm));
>> +	if (!new_fm) {
>> +		ret = -ENOMEM;
>> +		goto out_free;
>> +	}
>> +
>> +	new_fm->used_blocks = fm_size / ui->leb_size;
>> +
>> +	if (new_fm->used_blocks > UBI_FM_MAX_BLOCKS) {
>> +		sys_errmsg("fastmap too large");
>> +		ret = -ENOSPC;
>> +		goto out_free;
>> +	}
>> +	fm_raw = generate_fm_raw_data(ui, fm_size, used, fs_start_peb, ec,
>> +			vi, nsects);
>> +	if (!fm_raw) {
>> +		sys_errmsg("fastmap too large");
>> +		ret = -ENOSPC;
>> +		goto out_free;
>> +	}
>> +
>> +	for (i = 1; i < new_fm->used_blocks - 1; i++) {
>> +		new_fm->e[i].pnum = fs_start_peb + i - 1;
>> +		new_fm->e[i].ec = ec;
>> +	}
>> +	new_fm->e[0].pnum = anchor_peb;
>> +	new_fm->e[0].ec = ec;
>> +
>> +	fmsb = (struct ubi_fm_sb *)fm_raw;
>> +	for (i = 0; i < new_fm->used_blocks; i++) {
>> +		fmsb->block_loc[i] = cpu_to_be32(new_fm->e[i].pnum);
>> +		fmsb->block_ec[i] = cpu_to_be32(new_fm->e[i].ec);
>> +	}
>> +
>> +	fmsb->data_crc = 0;
>> +	fmsb->data_crc = cpu_to_be32(mtd_crc32(UBI_CRC32_INIT,
>> +						fm_raw, fm_size));
>> +	ret = write_new_fm_to_file(ui, new_fm, fm_raw, fm_size, out);
>> +
>> +out_free:
>> +	free(fm_raw);
>> +	free(new_fm);
>> +	return ret;
>> +}
>> diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
>> index 21409ca..7bb8272 100644
>> --- a/ubi-utils/ubiformat.c
>> +++ b/ubi-utils/ubiformat.c
>> @@ -663,7 +663,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
>>   			goto out_free;
>>
>>   		err = ubigen_write_layout_vol(ui, eb1, eb2, ec1,  ec2, vtbl,
>> -					      args.node_fd);
>> +					      args.node_fd, NULL);
>>   		free(vtbl);
>>   		if (err) {
>>   			errmsg("cannot write layout volume");
>> @@ -884,7 +884,7 @@ int main(int argc, char * const argv[])
>>   		normsg("use erase counter %lld for all eraseblocks", args.ec);
>>
>>   	ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, mtd.subpage_size,
>> -			 args.vid_hdr_offs, args.ubi_ver, args.image_seq);
>> +			 args.vid_hdr_offs, args.ubi_ver, args.image_seq, 0);
>>
>>   	if (si->vid_hdr_offs != -1 && ui.vid_hdr_offs != si->vid_hdr_offs) {
>>   		/*
>> @@ -905,7 +905,7 @@ int main(int argc, char * const argv[])
>>   		} else
>>   			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
>>   					 si->vid_hdr_offs, args.ubi_ver,
>> -					 args.image_seq);
>> +					 args.image_seq, 0);
>>   		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
>>   	}
>>
>> diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
>> index eccf41f..7d33731 100644
>> --- a/ubi-utils/ubinize.c
>> +++ b/ubi-utils/ubinize.c
>> @@ -31,6 +31,7 @@
>>   #include <getopt.h>
>>   #include <string.h>
>>   #include <fcntl.h>
>> +#include <linux/list.h>
>>
>>   #include <mtd/ubi-media.h>
>>   #include <libubigen.h>
>> @@ -38,6 +39,7 @@
>>   #include <libubi.h>
>>   #include "common.h"
>>   #include "ubiutils-common.h"
>> +#include "include/ubi-fastmap.h"
>>
>>   static const char doc[] = PROGRAM_NAME " version " VERSION
>>   " - a tool to generate UBI images. An UBI image may contain one or more UBI "
>> @@ -455,6 +457,14 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
>>   	else
>>   		vi->used_ebs = (st->st_size + vi->usable_leb_size - 1) / vi->usable_leb_size;
>>   	vi->compat = 0;
>> +	if (ui->max_leb_count > 0) {
>> +		vi->pebs = calloc(sizeof(int), ui->max_leb_count);
>> +		if (!vi->pebs) {
>> +			sys_errmsg("cannot allocate memory for vi->peb\n");
>> +			return -1;
>> +		}
>> +		memset(vi->pebs, -1, sizeof(int)*ui->max_leb_count);
>> +	}
>>   	return 0;
>>   }
>>
>> @@ -464,6 +474,10 @@ int main(int argc, char * const argv[])
>>   	struct ubigen_info ui;
>>   	struct ubi_vtbl_record *vtbl;
>>   	struct ubigen_vol_info *vi;
>> +	int used_cnt = 0;
>> +	struct list_head used;
>> +	struct ubi_wl_peb *new_peb;
>> +
>>   	off_t seek;
>>
>>   	err = parse_opt(argc, argv);
>> @@ -472,7 +486,7 @@ int main(int argc, char * const argv[])
>>
>>   	ubigen_info_init(&ui, args.peb_size, args.min_io_size,
>>   			 args.subpage_size, args.vid_hdr_offs,
>> -			 args.ubi_ver, args.image_seq);
>> +			 args.ubi_ver, args.image_seq, args.max_leb_count);
>>
>>   	verbose(args.verbose, "LEB size:                  %d", ui.leb_size);
>>   	verbose(args.verbose, "PEB size:                  %d", ui.peb_size);
>> @@ -517,7 +531,8 @@ int main(int argc, char * const argv[])
>>   		goto out_dict;
>>   	}
>>
>> -	vi = calloc(sizeof(struct ubigen_vol_info), sects);
>> +	/* Save vi[0] for layout volume */
>> +	vi = calloc(sizeof(struct ubigen_vol_info), sects + 1);
>>   	if (!vi) {
>>   		errmsg("cannot allocate memory");
>>   		goto out_dict;
>> @@ -528,11 +543,23 @@ int main(int argc, char * const argv[])
>>   	 * will be written later.
>>   	 */
>>   	seek = ui.peb_size * 2;
>> +	used_cnt += 2;
>>   	if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
>>   		sys_errmsg("cannot seek file \"%s\"", args.f_out);
>>   		goto out_free;
>>   	}
>>
>> +	/* If max_leb_count was provided, leave one PEB for FM superblock */
>> +	if (ui.max_leb_count > 0) {
>> +		seek = ui.peb_size * 3;
>> +		used_cnt++;
>> +		if (lseek(args.out_fd, seek, SEEK_SET) != seek) {
>> +			sys_errmsg("cannot seek file \"%s\"", args.f_out);
>> +			goto out_free;
>> +		}
>> +	}
>> +
>> +	INIT_LIST_HEAD(&used);
>>   	for (i = 0; i < sects; i++) {
>>   		const char *sname = iniparser_getsecname(args.dict, i);
>>   		const char *img = NULL;
>> @@ -597,7 +624,9 @@ int main(int argc, char * const argv[])
>>   			verbose(args.verbose, "writing volume %d", vi[i].id);
>>   			verbose(args.verbose, "image file: %s", img);
>>
>> -			err = ubigen_write_volume(&ui, &vi[i], args.ec, st.st_size, fd, args.out_fd);
>> +			err = ubigen_write_volume(&ui, &vi[i], args.ec,
>> +					st.st_size, fd, args.out_fd,
>> +					&used, &used_cnt);
>>   			close(fd);
>>   			if (err) {
>>   				errmsg("cannot write volume for section \"%s\"", sname);
>> @@ -611,14 +640,42 @@ int main(int argc, char * const argv[])
>>
>>   	verbose(args.verbose, "writing layout volume");
>>
>> -	err = ubigen_write_layout_vol(&ui, 0, 1, args.ec, args.ec, vtbl, args.out_fd);
>> +	err = ubigen_write_layout_vol(&ui, 0, 1, args.ec, args.ec, vtbl,
>> +			args.out_fd, &vi[sects]);
>>   	if (err) {
>>   		errmsg("cannot write layout volume");
>>   		goto out_free;
>> +	} else
>> +		verbose(args.verbose, "writing layout volume - done");
>> +
>> +	if (ui.max_leb_count > 0) {
>> +		vi[sects].pebs = calloc(sizeof(int), ui.max_leb_count);
>> +		if (!vi[sects].pebs) {
>> +			sys_errmsg("cannot allocate memory for vi->peb\n");
>> +			goto out_free;
>> +		}
>> +		memset(vi[sects].pebs, -1, sizeof(int)*ui.max_leb_count);
>> +		/* Add layout volume PEBs to used list */
>> +		for (i = 0; i < 2; i++) {
>> +			new_peb = malloc(sizeof(*new_peb));
>> +			if (!new_peb) {
>> +				sys_errmsg("mem allocation failed");
>> +				goto out_free;
>> +			}
>> +			new_peb->pnum = i;
>> +			new_peb->ec = args.ec;
>> +			vi[sects].pebs[i] = i;
>> +		}
>> +		vi[sects].reserved_pebs = 2;
>> +		add_fastmap_data(&ui, 2, used_cnt-1, args.ec, &used,
>> +				vi, sects+1, args.out_fd);
>> +		list_for_each_entry(new_peb, &used, list)
>> +			free(new_peb);
>> +		for (i = 0; i < sects; i++)
>> +			free(vi[i].pebs);
>>   	}
>>
>>   	verbose(args.verbose, "done");
>> -
>>   	free(vi);
>>   	iniparser_freedict(args.dict);
>>   	free(vtbl);
>> @@ -626,6 +683,10 @@ int main(int argc, char * const argv[])
>>   	return 0;
>>
>>   out_free:
>> +	list_for_each_entry(new_peb, &used, list)
>> +		free(new_peb);
>> +	for (i = 0; i < sects; i++)
>> +		free(vi[i].pebs);
>>   	free(vi);
>>   out_dict:
>>   	iniparser_freedict(args.dict);
>>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
