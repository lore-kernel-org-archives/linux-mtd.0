Received: from webmail12.mail.yandex.net ([213.180.223.102])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMf4i-0002Dl-Tk
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 07:15:22 +0100
Date: Mon, 11 Sep 2006 10:11:18 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <4504FE06.000003.08700@webmail12.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: dwmw2@infradead.org
Subject: Re: State of UBI
In-Reply-To: <1157910273.2977.175.camel@pmac.infradead.org>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<1157910273.2977.175.camel@pmac.infradead.org>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, jwboyer@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On Sun, 2006-09-10 at 21:00 +0400, dedekind wrote:
>> Full analogy with LVM. It'd be strange not to follow this model.
>
>Show me the changes that were made to ext3 to make it capable of
>mounting these new "LVM devices" where previously it could only do block
>devices.

I love your tricky questions :-)

Ok, the analogy is indeed not full and stops here. LVM does not change
semantics - you still have block devices with 2 operation - read and write.
I noted this already.

In case of UBI we do have meny semantical changes.

* UBI volumes are bad block free even if the underlying flash may have them
  (like NAND). UBI hides this completely.
* UBI volumes wear are free, i.e., you may use the same eraseblock as much as
  you want and the wear will anyway be distributed over whole flash.
* erase is always asynchronous, i.e., you call erase and it is scheduled for
  erasure in context of the UBI background task.
* we have eraseblock type hints which are useful to let UBI know which
  eraseblock it should pick (with low erase couter, or high, or medium).
  This is not present in MTD.
* UBI maintains volume update operation. This is absent in MTD.
* UBI maintains GC hints. They are useful for a file system to to avoid
  moving eraseblock which are going to be GCed anyway. This is not present
  in MTD. And this is not implemented yet. But is planned.
* UBI maintains atomic eraseblock change operation. This means you may
  change the contents of a LEB atomically. MTD is devoid of this nice
  property which is extremely useful for FSes (e.g., you may garbage
  collect without having a spare logical eraseblock). This is not yet
  implemented but it is easy to implement and it is panned.
* UBI volumes may be dynamically created, deleted and resized. MTD
  assumes only static stuff.

I believe the list is not full. New UBI-oriented software will certainly
make use of these properties and won't work on top of MTD.

For example, JFFS3 assumes that it does not have to think about
wear-levelling. And it makes no sense to use it on top of MTD. It is
UBI-oriented. And it needs only native UBI interface.

Nevertheless, having MTD interface is not a big geal. We may make gluebi
a part of UBI. Then you'll have native interface and MTD-like interfave for
legacy software.


VS. my changes in JFFS2 which make it usable on top of UBI. As soon as we
have gluebi we can forget about it.

Artem.
