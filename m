Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCNe5-0001vZ-0e
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 15:28:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by handhelds.org (Postfix) with ESMTP id D8CA3208554
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2004 15:28:08 -0400 (EDT)
Message-ID: <4159BB48.9040004@joshuawise.com>
Date: Tue, 28 Sep 2004 15:28:08 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <opse1g21zple1n2s@mail.tlt.hu>
In-Reply-To: <opse1g21zple1n2s@mail.tlt.hu>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [H2200-port] LAB - labmtd.c fixed, managed to boot a kernel on
 h2200 with LAB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sorry, I screwed up here and forgot to cc: to linux-mtd. When replying,
please cc: to h2200-port@handhelds.org

| I fixed the labmtd.c for the h2200. If you check my CVS log I mentioned
| that
| the shamcop_nand module defines a static partition at
| 0x00000000-0x02000000.

Ah, I see. You added code to remove the partition that shamcop_nand
defined. Cool. I'm not sure that this is the right way to do this,
though. cc:ing to linux-mtd.

| The lab tried to define other partitions over this regardeness of the
| already
| defined one.

| Yesterday I committed a small change in the assembly part of the
| armboot  module.
| Actually Joshua committed as I've seen. :) btw. Thanks Joshua.
Okay. I have some local diffs to armboot that get rid of the
get_mtd_partitions since it was not properly #ifdef'ed, and because it
was hardcoded to "ipaq:". CC'ing to MTD list also about that.

| Today I managed to boot a kernel via mtd driver as well as ymodem.
| So LAB is really booting a kernel now!
Excellent! For fun, try booting LAB from LAB. :) It should work (in
fact, I've tested it recently.)

Out of curiousity, what space on the MTD device are you using to store
your kernel?

joshua
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBWbtGPn9tWOqA4LMRAhQbAJ4kCg5QoqqPzWwTGTc5QwYPpwg9ZQCeJrrn
ba5HZZIuxW7QIeF0CYgV75Q=
=gl9+
-----END PGP SIGNATURE-----
