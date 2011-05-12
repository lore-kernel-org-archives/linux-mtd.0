Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKPxa-00080o-1g
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:05:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 8FDA519D8A
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 09:05:21 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y+IRkZM+-mQF for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 09:05:21 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by anubis.se.axis.com (Postfix) with ESMTP id 1949019D0B
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 09:05:21 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 1233634071
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 09:05:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p4C75KhH008549
	for <linux-mtd@lists.infradead.org>; Thu, 12 May 2011 09:05:20 +0200
Date: Thu, 12 May 2011 09:05:20 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI bad image sequence number error
In-Reply-To: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1105120903590.15966@lnxricardw.se.axis.com>
References: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 11 May 2011, Alex Levin wrote:

> UBI error: ubi_init: UBI error: cannot initialize UBI, error -22

(Not actually a response to Alex, more of a general comment on the code:)

I see a lot of these 'error -SOMETHING' in UBI error reports, is there not=
=20
a way for the driver to convert the error numbers to text strings? I=20
suspect the actual values can vary between architectures so the numbers=20
are sortof meaningless once you've left the system that generated them.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
