Received: from webmail31.rediffmail.com ([202.54.124.130] helo=rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18OXfq-0007s5-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 06:27:18 +0000
Date: 18 Dec 2002 06:56:53 -0000
Message-ID: <20021218065653.31296.qmail@webmail31.rediffmail.com>
MIME-Version: 1.0
From: "Pichai  Raghavan" <ragh_avan@rediffmail.com>
Reply-To: "Pichai  Raghavan" <ragh_avan@rediffmail.com>
To: linux-mtd@lists.infradead.org
Subject: amd flash problem
Content-type: multipart/mixed;
	boundary="Next_1040194613---0-202.54.124.130-31294"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

 This is a multipart mime message


--Next_1040194613---0-202.54.124.130-31294
Content-type: text/plain;
	format=flowed
Content-Disposition: inline

Hi All,

I am using the 2.4.2 MTD driver code on my board that has AMD
flash. I am noticing a bug in the write code. AMD flash driver
makes use of unlock bypass mode for doing bulk write; when 
issuing
the start and end of the unlock bypass commands;it does not 
check
if the flash state is READY.(function cfi_amdstd_write() in
cfi_cmdset_0002.c) In the meanwhile if the flash driver is doing
an erase or write in the context of another process and has got
scheduled out, then the flash gets into a unknown state.

This seems to be causing a problem when write to multiple
partitions are written. Has this problem been fixed in later
kernels? (Had a glance at 2.4.17 code and there also the same 
code
is there)

Thanks
Raghav



--Next_1040194613---0-202.54.124.130-31294
Content-type: message/rfc822

MIME-Version: 1.0
From: Mail Delivery System <Mailer-Daemon@pentafluge.infradead.org>
To: ragh_avan@rediffmail.com
Subject: Mail delivery failed: returning message to sender
Message-Id: <E18NvQO-0003sx-00@pentafluge.infradead.org>

This message was created automatically by mail delivery software (Exim).

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  lists-mtd@lists.infradead.org
    unknown local-part "lists-mtd" in domain "lists.infradead.org"

------ This is a copy of the message, including all the headers. ------

Return-path: <ragh_avan@rediffmail.com>
Received: from webmail31.rediffmail.com ([202.54.124.130] helo=rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NvQO-0003sv-00
	for <lists-mtd@lists.infradead.org>; Mon, 16 Dec 2002 13:36:48 +0000
Received: (qmail 2799 invoked by uid 510); 16 Dec 2002 14:06:31 -0000
Date: 16 Dec 2002 14:06:31 -0000
Message-ID: <20021216140631.2798.qmail@webmail31.rediffmail.com>
Received: from unknown (164.164.83.140) by rediffmail.com via HTTP; 16 dec 2002 14:06:31 -0000
MIME-Version: 1.0
From: "Pichai  Raghavan" <ragh_avan@rediffmail.com>
Reply-To: "Pichai  Raghavan" <ragh_avan@rediffmail.com>
To: lists-mtd@lists.infradead.org
Subject: AMD CFI driver problem
Content-type: text/plain;
	format=flowed
Content-Disposition: inline

Hi All,

I am using the 2.4.2 MTD driver code on my board that has AMD 
flash. I am noticing a bug in the write code. AMD flash driver 
makes use of unlock bypass mode for doing bulk write; when issuing 
the start and end of the unlock bypass commands;it does not check 
if the flash state is READY.(function cfi_amdstd_write() in 
cfi_cmdset_0002.c) In the meanwhile if the flash driver is doing 
an erase or write in the context of another process and has got 
scheduled out, then the flash gets into a unknown state.

This seems to be causing a problem when write to multiple 
partitions are written. Has this problem been fixed in later 
kernels? (Had a glance at 2.4.17 code and there also the same code 
is there)

Thanks
Raghav


--Next_1040194613---0-202.54.124.130-31294--
