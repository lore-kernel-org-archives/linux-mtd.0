Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ogof-0001A2-00
	for mtd-list@infradead.org; Thu, 26 Oct 2000 07:47:09 +0100
Received: from sj-msg-core-1.cisco.com ([171.71.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ogod-00019w-00
	for mtd@infradead.org; Thu, 26 Oct 2000 07:47:08 +0100
Received: from kaspit.cisco.com (kaspit.cisco.com [144.254.91.49])
	by sj-msg-core-1.cisco.com (8.9.3/8.9.1) with ESMTP id XAA08244
	for <mtd@infradead.org>; Wed, 25 Oct 2000 23:46:35 -0700 (PDT)
From: Udi Finkelstein <udif@bigfoot.com>
To: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel doc2001.c'
Date: Thu, 26 Oct 2000 08:46:28 +0200
Message-ID: <qlkfvsgvms3s0fu6u8kieqhjndrb4ch3v9@4ax.com>
References: <E13oMJV-0003oY-00@infradead.org> <18954.972464502@redhat.com> <39F6AF69.100AC50E@sis.com.tw>
In-Reply-To: <39F6AF69.100AC50E@sis.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 25 Oct 2000 18:01:13 +0800, Ollie Lho <ollie@sis.com.tw> wrote:

>David Woodhouse wrote:
>>=20
>> ollie@infradead.org said:
>> > Log Message:
>> > use memcpy_(from|to)_io to increase perfromance a little bit
>>=20
>> Here be dragons.
>>=20
>> Beware that this doesn't start trying to do 32-bit accesses, where the=
 top
>> three bytes are random, and that it doesn't break the ECC.
>>=20
>> Probably worth setting USE_MEMCPY in include/linux/mtd/doc2000.h in =
with
>> all the other arch-dependent stuff to set up ReadDOC etc.
>>=20
>
>Oops, sorry. I just copy it from the dis-asm of M-Systems' driver.
>USE_MEMCPY should be protected by #ifdef 386 stuff.

Do you put code disassembled from a proprietary M-systems' driver into a =
GPL
driver?
Do we really want that?

>Ollie

udi


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
