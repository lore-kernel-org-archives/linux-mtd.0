Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12NL3N-00005n-00
	for mtd-list@infradead.org; Tue, 22 Feb 2000 19:33:01 +0000
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12NL3L-00005g-00
	for mtd@infradead.org; Tue, 22 Feb 2000 19:32:59 +0000
Received: (from mtxmail@localhost)
	by morrison.matrox.com (8.8.8/8.8.8) id OAA11625
	for <mtd@infradead.org>; Tue, 22 Feb 2000 14:32:35 -0500 (EST)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.51.7])
	by venus.matrox.com (8.9.3/8.9.3) with ESMTP id OAA11138
	for <mtd@infradead.org>; Tue, 22 Feb 2000 14:31:47 -0500 (EST)
Received: from matrox.com (jlarin.matrox.com [192.168.18.107])
	by pluton.matrox.com (8.8.8/8.8.8) with ESMTP id OAA14255
	for <mtd@infradead.org>; Tue, 22 Feb 2000 14:29:59 -0500 (EST)
Message-ID: <38B2E3B9.16F0348A@matrox.com>
Date: Tue, 22 Feb 2000 14:30:01 -0500
From: =?iso-8859-1?Q?Jean=2DFran=E7ois?= Larin <jlarin@Matrox.COM>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: Question about FTL: Is it legal?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Hi,

I wanted to use the MTD package for an embedded system design and I
could not install it.  I decided to get the PCMCIA package since what
I'm interested into if the FTL (and the FTL in the current release of
the MTD is not up to date?).  I stumbled on something disturbing in the
header of ftl_cs.c:


/*======================================================================

    A Flash Translation Layer memory card driver

    This driver implements a disk-like block device driver with an
    apparent block size of 512 bytes for flash memory cards.

    ftl_cs.c 1.62 2000/02/01 00:59:04

   [ part or if removed]

    LEGAL NOTE: The FTL format is patented by M-Systems.  They have
    granted a license for its use with PCMCIA devices:

     "M-Systems grants a royalty-free, non-exclusive license under
      any presently existing M-Systems intellectual property rights
      necessary for the design and development of FTL-compatible
      drivers, file systems and utilities using the data formats with
      PCMCIA PC Cards as described in the PCMCIA Flash Translation
      Layer (FTL) Specification."

    Use of the FTL format for non-PCMCIA applications may be an
    infringement of these patents.  For additional information,
    contact M-Systems (http://www.m-sys.com) directly.

======================================================================*/

As anybody looked at the legal issue here? I mean, if we use a flash
chip and implement FTL in there, then we have to buy a licence from
M-System (ie pay royalties) because it is not a PCMCIA device?

Anybody knows royaltie-less alternative that are good for linux system?

Thank you.
--

************************************************************
Jean-Francois Larin ing. stag.      Head Office:
Software design                     1055 St. Regis Blvd.
Network Products Group              Dorval, Quebec, Canada
Matrox Electronic Systems           H9P 2T4
Tel:(514)685-7230 ext. 2041
Fax:(514)822-6272
E-Mail: JeanFrancois.Larin@matrox.com
************************************************************




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
