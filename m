Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGubB-0004Xd-Cy
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 18:13:22 +0000
Message-ID: <53079725.6080105@nod.at>
Date: Fri, 21 Feb 2014 19:12:53 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>,
 "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>	<CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>	<52EF772D.8080207@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>	<52EF9FFE.4020405@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>	<52F1F658.9080701@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>	<87zjlxy8lj.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>	<87txc4w698.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
 <877g8ojqsn.fsf@nbsps.com>
In-Reply-To: <877g8ojqsn.fsf@nbsps.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.02.2014 18:53, schrieb Bill Pringlemeir:
> On 21 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:
> 
>> Here I have the last parts of the two hopefully "valuable" traces. The
>> pieces show what happens between the leb_write_lock() und the
>> leb_write unlock() of the process which triggers the oops.  If this is
>> not enough, I can provide also more ...  Take care of the PIDs, there
>> are several processes with the same name running.  Boths traces did
>> not result from identical test cases, so there are some different
>> processes running.
> 
>> The part of the first trace fits in one paste:
> 
>> http://pastebin.com/TL3yNVcw
> 
> I am not sure if this is a complete trace?  I don't understand why we
> would start off with 'leb_write_unlock'...  However,
> 
> $ grep -E 'leb|ltree' ubi.crash.raw # slight edits
>   sync-7493    0.... 1348758715us : leb_write_unlock <-ubi_eba_write_leb
>   sync-7493    0.... 1348758719us : add_preempt_count <-leb_write_unlock
>   sync-7493    0...1 1348758724us : up_write <-leb_write_unlock
>   sync-7493    0...1 1348758739us : kfree <-leb_write_unlock
>   sync-7493    0...1 1348758746us : sub_preempt_count <-leb_write_unlock
>   sync-7493    0.... 1348758954us : ubifs_leb_write <-ubifs_wbuf_sync_nolock
>   sync-7493    0.... 1348758960us : ubi_leb_write <-ubifs_leb_write
>   sync-7493    0.... 1348758965us : ubi_eba_write_leb <-ubi_leb_write
>   sync-7493    0.... 1348758969us : leb_write_lock <-ubi_eba_write_leb
>   sync-7493    0.... 1348758973us : ltree_add_entry <-leb_write_lock
>   sync-7493    0.... 1348758977us : kmem_cache_alloc_trace <-ltree_add_entry
>   sync-7493    0.... 1348758983us : add_preempt_count <-ltree_add_entry
>   sync-7493    0...1 1348758989us : sub_preempt_count <-ltree_add_entry
>   sync-7493    0.... 1348758994us : kfree <-ltree_add_entry
>   sync-7493    0.... 1348758998us : down_write <-leb_write_lock
>   sync-7493    0.... 1348759010us : ubi_io_write <-ubi_eba_write_leb
> < many reschedules, but  sync-7493 still active.>
>    sync-7492    0.... 1348761397us : leb_write_unlock <-ubi_eba_write_leb
>    sync-7492    0.... 1348761400us : add_preempt_count <-leb_write_unlock
>    sync-7492    0...1 1348761406us : up_write <-leb_write_unlock
>    sync-7492    0...1 1348761419us : kfree <-leb_write_unlock
>    sync-7492    0...1 1348761425us : sub_preempt_count <-leb_write_unlock
>    sync-7492    0.... 1348761580us : ubifs_leb_write <-ubifs_write_node
>    sync-7492    0.... 1348761585us : ubi_leb_write <-ubifs_leb_write
>    sync-7492    0.... 1348761591us : ubi_eba_write_leb <-ubi_leb_write
>    sync-7492    0.... 1348761595us : leb_write_lock <-ubi_eba_write_leb
>    sync-7492    0.... 1348761599us : ltree_add_entry <-leb_write_lock
>    sync-7492    0.... 1348761603us : kmem_cache_alloc_trace <-ltree_add_entry
>    sync-7492    0.... 1348761609us : add_preempt_count <-ltree_add_entry
>    sync-7492    0...1 1348761615us : sub_preempt_count <-ltree_add_entry
>    sync-7492    0.... 1348761619us : kfree <-ltree_add_entry
>    sync-7492    0.... 1348761622us : down_write <-leb_write_lock
>    sync-7492    0.... 1348761635us : ubi_io_write <-ubi_eba_write_leb
>    sync-7492    0.... 1348771081us : leb_write_unlock <-ubi_eba_write_leb
>    sync-7492    0.... 1348771084us : add_preempt_count <-leb_write_unlock
>    sync-7492    0...1 1348771090us : up_write <-leb_write_unlock
>    sync-7492    0...1 1348771102us : kfree <-leb_write_unlock
>    sync-7492    0...1 1348771109us : sub_preempt_count <-leb_write_unlock
>    sync-7492    0.... 1348771269us : ubifs_leb_write <-ubifs_write_node
>    sync-7492    0.... 1348771275us : ubi_leb_write <-ubifs_leb_write
>    sync-7492    0.... 1348771280us : ubi_eba_write_leb <-ubi_leb_write
>    sync-7492    0.... 1348771285us : leb_write_lock <-ubi_eba_write_leb
>    sync-7492    0.... 1348771289us : ltree_add_entry <-leb_write_lock
>    sync-7492    0.... 1348771292us : kmem_cache_alloc_trace <-ltree_add_entry
>    sync-7492    0.... 1348771299us : add_preempt_count <-ltree_add_entry
>    sync-7492    0...1 1348771304us : sub_preempt_count <-ltree_add_entry
>    sync-7492    0.... 1348771308us : kfree <-ltree_add_entry
>    sync-7492    0.... 1348771311us : down_write <-leb_write_lock
>    sync-7492    0.... 1348771324us : ubi_io_write <-ubi_eba_write_leb
> < many reschedules and sync-7493 still in ubi_eba_write_leb>
>   sync-7493    0.... 1348781410us : leb_write_unlock <-ubi_eba_write_leb
>   sync-7493    0.... 1348781413us : add_preempt_count <-leb_write_unlock
>   sync-7493    0...1 1348781418us : up_write <-leb_write_unlock
> ...
> 
> I am not sure that we can know which LEBs are involved.  However, I see
> cases for a double free and other issues.  I think we need
> 'atomic_dec_and_test()' on the leb->users and to check this in the tree
> lookup.  For instance, in 'leb_write_unlock()', the call to 'up_write()'
> can cause a reschedule.  Say we enter 'leb_write_unlock()' with 'users =
> 2'.  The count will decrement to one and then we may reschedule in
> 'up_write'.  The 2nd UBI task may decrement users and inspect the count
> and call 'kfree'.  Then we return to the original 'leb_write_unlock()',
> we will inspect 'le->users' and it will be zero.
> 
> static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)
> {
> 	struct ubi_ltree_entry *le;
> 
> 	spin_lock(&ubi->ltree_lock);
> 	le = ltree_lookup(ubi, vol_id, lnum);
> 	le->users -= 1;
> 	ubi_assert(le->users >= 0);
> 	up_write(&le->mutex);         /* can cause reschedule */
> 	if (le->users == 0) {
> 		rb_erase(&le->rb, &ubi->ltree);
> 		kfree(le);
> 	}
> 	spin_unlock(&ubi->ltree_lock);
> }
> 
> Maybe there are better kernel design's/APIs that can wrap this.
> However, I don't think the 'ubi_ltree_entry' is perfectly race free.
> 
> On the IMX series, the MTD driver does a 'read-modify-write' to support
> sub-pages.  The driver can not write to a subpage at a time.  The MTD
> driver is also interrupt driven and several reschedules happened during
> ubi_io_write().
> 
> I don't think the spin_lock() will do anything on a UP system like the
> ARM926's that have encountered this issue.

Also on UP a spin_lock disables preemption.
So, le->users is protected.

Thanks,
//richard
