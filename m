Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBN1E-0005FM-00
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 21:12:50 -0500
Received: by zproxy.gmail.com with SMTP id v1so1117577nzb
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Feb 2006 18:12:46 -0800 (PST)
Message-ID: <35fb2e590602201812y798201c1nd4367ae95ec35c2b@mail.gmail.com>
Date: Tue, 21 Feb 2006 02:12:45 +0000
From: "Jon Masters" <jonmasters@gmail.com>
To: "Charles Manning" <manningc2@actrix.gen.nz>
In-Reply-To: <200602211408.05208.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
	<200602211408.05208.manningc2@actrix.gen.nz>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> YAFFS for devices with no OOB
Reply-To: jonathan@jonmasters.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/21/06, Charles Manning <manningc2@actrix.gen.nz> wrote:

> OK, I'll start investigating an OOB-less YAFFS and give that a priority
> depending on the amount of interest. Hint to everyone: If this sounds
> interesting, respond (on or off list), especially if you'd like to be
> involved in some way.

I'd like to play with this, but I need to pick up a board for myself
before I do much more YAFFS work - all the existing stuff was done on
boards in the Monta office.

> I think a final solution that exploits OOB if it is available but will wo=
rk if
> OOB is not available would be best.

Per my last mail, I think that's the best solution. Might take a bit
of work on MTD too.

Shove stuff my way please Charles and if I'm not frantically writing
chapters then I'll take a look :-)

Jon.
