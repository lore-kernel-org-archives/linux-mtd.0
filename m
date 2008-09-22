Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhkR4-0007ES-93
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 12:22:39 +0000
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
References: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
	<lyhc8ccfzv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<Pine.LNX.4.64.0809221107180.29177@lnxricardw.se.axis.com>
	<Pine.LNX.4.64.0809221157370.29177@lnxricardw.se.axis.com>
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 22 Sep 2008 14:22:02 +0200
In-Reply-To: <Pine.LNX.4.64.0809221157370.29177@lnxricardw.se.axis.com>
	(Ricard Wanderlof's message of "Mon,
	22 Sep 2008 11:58:26 +0200 (CEST)")
Message-ID: <lytzc89xqt.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof <ricard.wanderlof@axis.com> writes:

>>> Some Hynix NAND chips seem to have problems with bus arbitration;
>>> e.g. they continue to shift out data when chipselect is
>>> deasserted during a operation (e.g. because ethernet controller
>>> was accessed in this time).  We saw this with HY27UG088G5M on
>>> PXA320 and read-page operations.
>> ...
> Did you only see the problem with page read operations, or was
> it a general problem. We don't even seem to get by the ID read
> stage.

We saw this only during page-read operations.  But access is
handled completely by the PXA320 which reads data from NAND in
bursts. Hence, nCS won't change during small transfer so that the
brokeness is not triggered at read-id operations.


Enrico
