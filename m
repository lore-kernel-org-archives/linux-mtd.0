From: Mail Delivery System <Mailer-Daemon@infradead.org>
To: linux-mtd-bounces@lists.infradead.org
Message-Id: <E1BwiMO-0007EC-Uw@canuck.infradead.org>
Date: Mon, 16 Aug 2004 10:21:16 -0400
Subject: Mail delivery failed: returning message to sender
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  lukefimmerzane@hotmail.com
    SMTP error from remote mailer after RCPT TO:<lukefimmerzane@hotmail.com>:
    host mx1.hotmail.com [65.54.252.99]: 550 Requested action not taken:
    mailbox unavailable

------ This is a copy of the message, including all the headers. ------

Return-path: <linux-mtd-bounces@lists.infradead.org>
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiLa-0007B5-TB; Mon, 16 Aug 2004 10:20:27 -0400
From: linux-mtd-request@lists.infradead.org
Subject: linux-mtd Digest, Vol 17, Issue 17
To: linux-mtd@lists.infradead.org
Reply-To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org
Message-ID: <E1BwiLa-0007B5-TB@canuck.infradead.org>
Date: Mon, 16 Aug 2004 10:20:27 -0400

Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Support of stupid devices (Ian Molton)
   2. Re: Support of stupid devices (Thomas Gleixner)
   3. Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and
      cfi_probe (Josh Boyer)
   4. Mail delivery failed: returning message to sender
      (Mail Delivery System)
   5. failure notice (MAILER-DAEMON@conectiva.com.br)
   6. failure notice (MAILER-DAEMON@conectiva.com.br)
   7. Mail delivery failed: returning message to sender
      (Mail Delivery System)


----------------------------------------------------------------------

Message: 1
Date: Mon, 16 Aug 2004 01:39:33 +0100
From: Ian Molton <spyro@f2s.com>
Subject: Support of stupid devices
To: linux-mtd@lists.infradead.org
Message-ID: <20040816013933.163a101d.spyro@f2s.com>
Content-Type: text/plain; charset=US-ASCII

Hi.

Im porting linux to the toshiba e7xx and 8xx PDAs which contain a nand flash controller.

Im not certain, but it appears the controllerhas an odd quirk meaning byte-reads of the data register dont work as the linux mtd code expects.

AFAICT if I read a word (after issuing a chipid command) I get:

0xYYZZ75ec   -- this is good - Samsung, 32MB device.

if I do two byte reads I get 0xec 0xec.

a halfword access gets me 0xYYZZ.

a misaligned (by one byte) word access gives me 0xecYYZZ75, but this fails to work for byte accesses. halfword misaligned accesses are just weird.

so basically, the only way to read the chipid is to do:

a word access to the data reg and then shift the data out

or

a word access (and mask off the high 3 bytes followed by a misaligned word access and mask off the upper 3 bytes.

clearly the former solution is the better one, but this doesnt fit in the nand driver model very well (read_byte() et.al.)

the chip is a TC6393XB (system on chip) and the flash is a samsung K9F5608UOC YCBO



------------------------------

Message: 2
Date: Mon, 16 Aug 2004 15:11:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Support of stupid devices
To: Ian Molton <spyro@f2s.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <1092661877.4354.10.camel@lap02.tec.linutronix.de>
Content-Type: text/plain

On Mon, 2004-08-16 at 02:39, Ian Molton wrote:
> Hi.
> 
> Im porting linux to the toshiba e7xx and 8xx PDAs
> which contain a nand flash controller.
> Im not certain, but it appears the controllerhas an
> odd quirk meaning byte-reads of the data register
> dont work as the linux mtd code expects.
> 
> AFAICT if I read a word (after issuing a chipid command) I get:
> 
> 0xYYZZ75ec   -- this is good - Samsung, 32MB device.
> 
> if I do two byte reads I get 0xec 0xec.
> 
> a halfword access gets me 0xYYZZ.
> a misaligned (by one byte) word access gives me 0xecYYZZ75, 

Sounds really stupid :)

> but this fails to work for byte accesses. halfword misaligned
> accesses are just weird.
> so basically, the only way to read the chipid is to do:
> a word access to the data reg and then shift the data out
> or
> a word access (and mask off the high 3 bytes followed by a
> misaligned word access and mask off the upper 3 bytes.
> clearly the former solution is the better one, but this 
> doesnt fit in the nand driver model very well 
> (read_byte() et.al.)

You can provide your own read_byte() et. al. functions which do all the
magic. Look into the other Toshiba nand driver implementations. They do
the same. I don't have the header files which implement the real access
but Alice should be a source of help.

> the chip is a TC6393XB (system on chip) and the flash 
> is a samsung K9F5608UOC YCBO

tglx


> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/




------------------------------

Message: 3
Date: Mon, 16 Aug 2004 09:13:19 -0500
From: Josh Boyer <jdub@us.ibm.com>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and
	cfi_probe
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Message-ID: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh




------------------------------

Message: 4
Date: Mon, 16 Aug 2004 10:14:32 -0400
From: Mail Delivery System <Mailer-Daemon@infradead.org>
Subject: Mail delivery failed: returning message to sender
To: linux-mtd-bounces@lists.infradead.org
Message-ID: <E1BwiFs-0006gs-TJ@canuck.infradead.org>

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  joern@wohnheim.fh-wedel.de
    retry time not reached for any host after a long failure period

------ This is a copy of the message, including all the headers. ------

Return-path: <linux-mtd-bounces@lists.infradead.org>
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiFQ-0006YI-H8; Mon, 16 Aug 2004 10:14:04 -0400
Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiF0-0006YB-1m
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 10:13:41 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i7GEDKmL743234;
	Mon, 16 Aug 2004 10:13:20 -0400
Received: from [9.10.78.208] (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i7GEDIB0207952; Mon, 16 Aug 2004 08:13:19 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31xic6d79.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
	<m31xic6d79.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.5 (1.4.5-7) 
Date: Mon, 16 Aug 2004 09:13:19 -0500
Content-Transfer-Encoding: 7bit
X-Spam-Score: 0.0 (/)
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/



------------------------------

Message: 5
Date: 16 Aug 2004 15:12:03 -0000
From: MAILER-DAEMON@conectiva.com.br
Subject: failure notice
To: linux-mtd-bounces@lists.infradead.org
Message-ID: <20040816141423.0D13947448@perninha.conectiva.com.br>

Hi. This is the qmail-send program at conectiva.com.br.
I'm afraid I wasn't able to deliver your message to the following addresses.
This is a permanent error; I've given up. Sorry it didn't work out.

<beckmann@burns.conectiva>:
Sorry, no mailbox here by that name. (#5.1.1)

--- Below this line is a copy of the message.

Return-Path: <linux-mtd-bounces@lists.infradead.org>
Received: (qmail 18818 invoked by uid 0); 16 Aug 2004 15:12:03 -0000
Received: from perninha.conectiva.com.br (200.140.247.100)
  by burns.conectiva with SMTP; 16 Aug 2004 15:12:03 -0000
Received: by perninha.conectiva.com.br (Postfix)
	id E549947448; Mon, 16 Aug 2004 11:14:22 -0300 (BRT)
Delivered-To: beckmann@conectiva.com.br
Received: by perninha.conectiva.com.br (Postfix, from userid 568)
	id DD0784745F; Mon, 16 Aug 2004 11:14:22 -0300 (BRT)
Received: from canuck.infradead.org (canuck.infradead.org [205.233.218.70])
	by perninha.conectiva.com.br (Postfix) with ESMTP id D346947448
	for <beckmann@conectiva.com.br>; Mon, 16 Aug 2004 11:14:20 -0300 (BRT)
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiFQ-0006YI-Qn; Mon, 16 Aug 2004 10:14:04 -0400
Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiF0-0006YB-1m
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 10:13:41 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i7GEDKmL743234;
	Mon, 16 Aug 2004 10:13:20 -0400
Received: from [9.10.78.208] (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i7GEDIB0207952; Mon, 16 Aug 2004 08:13:19 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31xic6d79.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
	<m31xic6d79.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.5 (1.4.5-7) 
Date: Mon, 16 Aug 2004 09:13:19 -0500
Content-Transfer-Encoding: 7bit
X-Spam-Score: 0.0 (/)
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org
X-Bogosity: No, tests=bogofilter, spamicity=0.262721, version=0.16.3

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/



------------------------------

Message: 6
Date: 16 Aug 2004 15:11:58 -0000
From: MAILER-DAEMON@conectiva.com.br
Subject: failure notice
To: linux-mtd-bounces@lists.infradead.org
Message-ID: <20040816141418.1D1A5473D8@perninha.conectiva.com.br>

Hi. This is the qmail-send program at conectiva.com.br.
I'm afraid I wasn't able to deliver your message to the following addresses.
This is a permanent error; I've given up. Sorry it didn't work out.

<fuganti@burns.conectiva>:
Sorry, no mailbox here by that name. (#5.1.1)

--- Below this line is a copy of the message.

Return-Path: <linux-mtd-bounces@lists.infradead.org>
Received: (qmail 18808 invoked by uid 0); 16 Aug 2004 15:11:58 -0000
Received: from perninha.conectiva.com.br (200.140.247.100)
  by burns.conectiva with SMTP; 16 Aug 2004 15:11:58 -0000
Received: by perninha.conectiva.com.br (Postfix)
	id E3EB5473D8; Mon, 16 Aug 2004 11:14:17 -0300 (BRT)
Delivered-To: fuganti@conectiva.com.br
Received: by perninha.conectiva.com.br (Postfix, from userid 568)
	id D0FF0473E4; Mon, 16 Aug 2004 11:14:17 -0300 (BRT)
Received: from canuck.infradead.org (canuck.infradead.org [205.233.218.70])
	by perninha.conectiva.com.br (Postfix) with ESMTP id 71F4B473F1
	for <fuganti@conectiva.com.br>; Mon, 16 Aug 2004 11:14:14 -0300 (BRT)
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiFP-0006YI-G4; Mon, 16 Aug 2004 10:14:03 -0400
Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiF0-0006YB-1m
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 10:13:41 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i7GEDKmL743234;
	Mon, 16 Aug 2004 10:13:20 -0400
Received: from [9.10.78.208] (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i7GEDIB0207952; Mon, 16 Aug 2004 08:13:19 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31xic6d79.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
	<m31xic6d79.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.5 (1.4.5-7) 
Date: Mon, 16 Aug 2004 09:13:19 -0500
Content-Transfer-Encoding: 7bit
X-Spam-Score: 0.0 (/)
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org
X-Bogosity: No, tests=bogofilter, spamicity=0.262721, version=0.16.3

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/



------------------------------

Message: 7
Date: Mon, 16 Aug 2004 10:16:09 -0400
From: Mail Delivery System <Mailer-Daemon@infradead.org>
Subject: Mail delivery failed: returning message to sender
To: linux-mtd-bounces@lists.infradead.org
Message-ID: <E1BwiHR-0006tb-21@canuck.infradead.org>

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  joern@wohnheim.fh-wedel.de
    retry time not reached for any host after a long failure period

------ This is a copy of the message, including all the headers. ------

Return-path: <linux-mtd-bounces@lists.infradead.org>
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiGo-0006hX-JJ; Mon, 16 Aug 2004 10:15:30 -0400
Received: from exim by canuck.infradead.org with local (Exim 4.33 #1 (Red Hat
	Linux)) id 1BwiFs-0006gs-TJ
	for linux-mtd-bounces@lists.infradead.org;
	Mon, 16 Aug 2004 10:14:33 -0400
X-Failed-Recipients: joern@wohnheim.fh-wedel.de
Auto-Submitted: auto-generated
From: Mail Delivery System <Mailer-Daemon@infradead.org>
To: linux-mtd-bounces@lists.infradead.org
Message-Id: <E1BwiFs-0006gs-TJ@canuck.infradead.org>
Date: Mon, 16 Aug 2004 10:14:32 -0400
Subject: Mail delivery failed: returning message to sender
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  joern@wohnheim.fh-wedel.de
    retry time not reached for any host after a long failure period

------ This is a copy of the message, including all the headers. ------

Return-path: <linux-mtd-bounces@lists.infradead.org>
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiFQ-0006YI-H8; Mon, 16 Aug 2004 10:14:04 -0400
Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwiF0-0006YB-1m
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2004 10:13:41 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i7GEDKmL743234;
	Mon, 16 Aug 2004 10:13:20 -0400
Received: from [9.10.78.208] (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i7GEDIB0207952; Mon, 16 Aug 2004 08:13:19 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m31xic6d79.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
	<1089735455.29112.14.camel@weaponx.rchland.ibm.com>
	<m31xic6d79.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1092665599.2912.120.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.4.5 (1.4.5-7) 
Date: Mon, 16 Aug 2004 09:13:19 -0500
Content-Transfer-Encoding: 7bit
X-Spam-Score: 0.0 (/)
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces@lists.infradead.org

On Thu, 2004-08-12 at 02:13, Eric W. Biederman wrote:
> So far I have been busy with other things so I have been taking the slow route
> to refactoring.  I have just reported the cfi_fixup function from cfi_util
> and have gotten nearly all of the variation in cfi_cmdset_0001 and cfi_cmdset_0002
> under control.  
> 
> It is probably enough infrastructure so that cfi_cmdset_0001 and 0020 could be
> merged.

Sorry for the delay.  Maybe I can convince Joern to get them merged. 
Most of the stuff can probably be done in a fixup function now that they
take a struct mtd_info *.

> 
> For the deeper pieces of command set common code moving their helper functions
> into cfi_util is probably a good place to start.
> 
> I'm hoping I have accomplished enough I don't need to touch the code again for quite a while but...

We can always hope :).

josh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/



------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 17, Issue 17
*****************************************
