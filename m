Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OqPer-0006Rt-Vy
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 12:09:46 +0000
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Stefani Seibold <stefani@seibold.net>
To: dedekind1@gmail.com
In-Reply-To: <1282489456.16502.74.camel@brekeke>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1280244117.3021.36.camel@localhost.localdomain>
	<1280296009.4310.5.camel@wall-e.seibold.net>
	<1282489456.16502.74.camel@brekeke>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 31 Aug 2010 14:09:47 +0200
Message-ID: <1283256587.7515.16.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Kreuzer, Michael \(NSN - DE/Ulm\)" <michael.kreuzer@nsn.com>,
	linux-mtd@lists.infradead.org, "Pagliari,
	Vivenzio \(NSN - DE/Ulm\)" <vivenzio.pagliari@nsn.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, den 22.08.2010, 18:04 +0300 schrieb Artem Bityutskiy:
> 
> Yes, but your patch fixes the symptom, unfortunately. It is ok for you
> to use as a work-around, but I still hope to find the root cause.
> 

True, but also if we fix the cause, this could happen. Imagine that one
of the two master LEB will get corrupted, due a flash error or a power
fail during a write access. Than the system should able to mount this
damaged file system and restore the lost master LEB.

We should try to make UBIFS as robustly as possible and handle all
possible errors.
 
My path is only a first idea to solve this kind of problem. I think it
must enhanced by restoring the LEB when the filesystem is mounted
read-write.

I think it is important to be a bit more defensive and assume the worst
case.

- Stefani
