Received: from hu-out-0506.google.com ([72.14.214.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOZyb-0001e1-EF
	for linux-mtd@lists.infradead.org; Tue, 06 Mar 2007 08:45:14 -0500
Received: by hu-out-0506.google.com with SMTP id 28so1769776hug
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Mar 2007 05:45:10 -0800 (PST)
Message-ID: <2cf1ee820703060545p304b907bt614d13896698136e@mail.gmail.com>
Date: Tue, 6 Mar 2007 15:45:04 +0200
From: "emin ak" <eminak71@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD and crypt
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a similar mail that recently posted to linux kernel maillist.
And also I have some additons to the topic.
Here is my previous mail
----------
Hi Folks,
I need to encrypt a jffs2/mtd formatted flash filesystem for an
embedded device, Normally using a loopback interface (cryptoloop,
DM-crypt or loop-aes) solves this problem but they are not well known
on journalling file systems (like jffs2) because of cached write etc..
Also I could'nt find any guideline for encrypting filesystem on a
flash.
There is an ugly workaround to overcome this problem, I have placed an
encrypted ext2 filesystem image on an normal jffs2 partition and mount
this encrypted partition on a loopback, but this is not secure,
consumes alot for disk space and not reliable (is'nt it?)
Is there any other way to encrypt an jjffs2 partition, if not, what do
you think about my ugly workaround?
Thanks a lot
Emin
--------
Thanks for your replies.

>Hello to all,
>What is best way for encrypting user space FS, I know for dm-crypt and it seems
>that could be good choice, but I am not sure that this combination
can work with
>MTD devices?
>
>Do You have any remarks or hints?
>
>Thanks in advice
>Mile
