Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746BAC43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDhUa0OEOCr4dMBoHvxXDyXVOtEREMoFUsdsmpgBsX8=; b=zOMoEhnhRGdn22
	mFLBJUFPF8mpiFBzsXv4h/ZOL1OA6ff/vfSCyH89zzIaOADcsIKULgbVSg8R9gd/lQMkU2RjGSOu/
	ehoU6e/dNkBX+OPMcQ+pcjXxECxxpTWRKHR3oLMyjVwsQsHf2u1NpbBb8ZP+RFB+jP5bEpjP+ZKP+
	lwoJuceQUgVaxhO1yLVd2n1D9wWzFN2TaonMtbPsbOv2qySehh4Y4VFdryUUpIDqVExxifg57Ba4l
	daJrn3XL+ManJPAJy8FU45zDnfbOT9haPu5o3LOGos1lo7y643zUOMhDMCVBacCl1Be8zip0tesiy
	t49I10FDnzVPdDV71+hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQVm-009Vsn-18; Sun, 24 Jul 2022 01:34:26 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQVi-009Vnt-Rq
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:34:25 +0000
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 26O1Y04R017520;
	Sun, 24 Jul 2022 10:34:00 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Sun, 24 Jul 2022 10:34:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 26O1Xw0c017512
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 24 Jul 2022 10:34:00 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a02e58da-5d30-d138-83d4-5545aba1f035@I-love.SAKURA.ne.jp>
Date: Sun, 24 Jul 2022 10:33:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>
References: <00000000000040624a05e2a6f2db@google.com>
 <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
 <62da6803.1c69fb81.2a10f.9bf1@mx.google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <62da6803.1c69fb81.2a10f.9bf1@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_183423_174967_803F7B51 
X-CRM114-Status: GOOD (  17.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2022/07/22 11:51, Christian Marangi wrote:
> On Fri, Jul 22, 2022 at 11:34:57AM +0900, Tetsuo Handa wrote:
>> mtd_check_of_node() was added by commit ad9b10d1eaada169 ("mtd: core:
>> introduce of support for dynamic partitions").
>>
>> I guess that sometimes (depending on probe timing) mtd->parent is NULL.
>> Please check what mtd->parent == NULL means.
>>
>> +	/* Check if a partitions node exist */
>> +       parent = mtd->parent;
>> +       parent_dn = dev_of_node(&parent->dev);
>>
> 
> Currently there is thix [1].

OK. Then for now can we try that "prevent the crash" patch (and defer
examining the cause of being NULL) ?

> 
> Anyway you comment means a device may probe defer and have the parent
> still set to NULL? How can we check that?

My comment is just a guess. I have zero experience in this area.

If this problem is not timing dependent, syzbot would have already
reported this problem for thousands times. But since syzbot reported
this problem only 84 times in 23 days, I think that this problem is
timing dependent (i.e. some race condition).

> 
> Return PROBE_DEFER always when no mtd parent is found?

We could try tracing what value is assigned to mtd->parent, by
introducing a validation wrapper function (which validates that
the address is a valid kernel address) like

----------------------------------------
diff --git a/include/linux/bug.h b/include/linux/bug.h
index 348acf2558f3..6b1626776b95 100644
--- a/include/linux/bug.h
+++ b/include/linux/bug.h
@@ -91,4 +91,12 @@ static inline __must_check bool check_data_corruption(bool v) { return v; }
 		corruption;						 \
 	}))
 
+extern void check_valid_kernel_ptr(void *arg, const char *name);
+#define valid_kernel_ptr(ptr)						\
+	({								\
+		typeof(ptr) tmp = (ptr);				\
+		check_valid_kernel_ptr(tmp, __stringify(ptr));		\
+		tmp;							\
+	})
+
 #endif	/* _LINUX_BUG_H */
diff --git a/lib/bug.c b/lib/bug.c
index c223a2575b72..6555766134cf 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -231,3 +231,10 @@ void generic_bug_clear_once(void)
 
 	clear_once_table(__start___bug_table, __stop___bug_table);
 }
+
+void check_valid_kernel_ptr(void *arg, const char *name)
+{
+	WARN(!arg, "%s is NULL\n", name);
+	WARN(IS_ERR(arg), "%s is %pe\n", name, arg);
+}
+EXPORT_SYMBOL(check_valid_kernel_ptr);
----------------------------------------

and wrapping all locations that modifies mtd->parent like

----------------------------------------
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d442fa94c872..2e81539ddfd8 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -81,9 +81,9 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	 * distinguish between the parent and its partitions in sysfs.
 	 */
 	child->dev.parent = IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd_is_partition(parent) ?
-			    &parent->dev : parent->dev.parent;
+		&parent->dev : valid_kernel_ptr(parent->dev.parent);
 	child->dev.of_node = part->of_node;
-	child->parent = parent;
+	child->parent = valid_kernel_ptr(parent);
 	child->part.offset = part->offset;
 	INIT_LIST_HEAD(&child->partitions);
 
----------------------------------------

. If none of all wrapped assignments triggers, we would need to check
locations that explicitly assign NULL. (That is, possibility of hitting
a race that the parent was once non-NULL but then became NULL due to
error or cleanup path.)

We can add some CONFIG_ option for controlling whether check_valid_kernel_ptr()
should become

#define valid_kernel_ptr(ptr) (ptr)

so that we can avoid overhead when this problem if fixed.

Linus, can we have macros like valid_kernel_ptr() ? Macros like
valid_kernel_ptr(), valid_kernel_ptr_or_null(), valid_kernel_ptr_or_err() can
serve for documentation purpose without runtime cost for non-debug builds.

> 
> [1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20220703095631.16508-1-ansuelsmth@gmail.com/
> 
>> On 2022/06/30 18:32, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    6cc11d2a1759 Add linux-next specific files for 20220630
>>> git tree:       linux-next
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1640f850080000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=54f75b620e3845dd
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd
>>> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>> Reported-by: syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
