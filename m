Date: 16 Aug 2004 15:11:58 -0000
From: MAILER-DAEMON@conectiva.com.br
To: linux-mtd-bounces@lists.infradead.org
Message-Id: <20040816141418.1D1A5473D8@perninha.conectiva.com.br>
Subject: failure notice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
