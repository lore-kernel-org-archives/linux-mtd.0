Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GesEh-0008Bj-5p
	for linux-mtd@lists.infradead.org; Tue, 31 Oct 2006 11:56:57 +0000
Date: Tue, 31 Oct 2006 12:58:22 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code
In-Reply-To: <20061030145105.84f953e7.vwool@ru.mvista.com>
Message-ID: <Pine.LNX.4.64.0610311249420.25906@lnxricardw.se.axis.com>
References: <20061030145105.84f953e7.vwool@ru.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 30 Oct 2006, Vitaly Wool wrote:

> The patch inlined below makes an attempt to change the interface to more=
=20
> intuitive, ie when ops.datbuf is NULL, ops.len is ignored, and=20
> ops.ooblen is used throughout to specify the full OOB read/write length.

My only comment at this stage is a trivial one: many of the debug texts do=
=20
not match the function they are placed in. Doesn't really have anything to=
=20
do with the reason for the patch though, but makes for confusing debug=20
output.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
