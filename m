Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VVta-0003NS-00
	for mtd-list@infradead.org; Wed, 21 Feb 2001 09:49:14 +0000
Received: from gw-nl4.philips.com ([212.153.190.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VVtZ-0003NK-00
	for mtd@infradead.org; Wed, 21 Feb 2001 09:49:13 +0000
Received: from smtprelay-nl1.philips.com (localhost.philips.com [127.0.0.1])
          by gw-nl4.philips.com with ESMTP id KAA27043
          for <mtd@infradead.org>; Wed, 21 Feb 2001 10:49:10 +0100 (MET)
          (envelope-from erik.niessen@philips.com)
From: erik.niessen@philips.com
Received: from notessmtp-nl1.philips.com (notessmtp-nl1.philips.com [130.139.36.10])
	by smtprelay-nl1.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id KAA16392
	for <mtd@infradead.org>; Wed, 21 Feb 2001 10:49:09 +0100 (MET)
Received: from EHLMS01.DIAMOND.PHILIPS.COM (ehlms01sv1.diamond.philips.com [130.139.54.212])
	by notessmtp-nl1.philips.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id KAA13752
	for <mtd@infradead.org>; Wed, 21 Feb 2001 10:49:08 +0100 (MET)
To: <mtd@infradead.org>
Subject: combine 2 banks into a single mtd device?
Message-ID: <0056890022171085000002L952*@MHS>
Date: Wed, 21 Feb 2001 10:50:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; name="MEMO 02/21/01 10:47:13"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I am trying to boot from flash on the SC520 development platform from A=
MD.
>From Vipin I received some code to access the flash. But with this code=
 I get
two devices mtd0 and mtd1 for each flash bank of 8 MB.

Is there a way to combine the two banks into one mtd device of 16MB? So=
 that
I can put a simple Linux system on it.

David is the jffs2 code beta enough for some read only testing?

Thanks for reading sofar.

	Erik

=


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
