Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRsqf-0007li-EI
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2018 05:25:08 +0000
Subject: Re: Regression due to "Return correct error number in
 ubi_get_vol_info1" in mtd-utils 2.0.1+
To: Christian Lamparter <chunkeey@gmail.com>, linux-mtd@lists.infradead.org
References: <2542341.JDPxxHf69l@debian64>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <e55d9610-64c3-5e93-63cf-a97adb35c52e@sigma-star.at>
Date: Sun, 10 Jun 2018 07:24:40 +0200
MIME-Version: 1.0
In-Reply-To: <2542341.JDPxxHf69l@debian64>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the commit you mentioned was part of a series that tried to fix some odd =
errors
encountered when using mtd/ubi utilities if the MTD subsystem wasn't pres=
ent,
or MTD was present but UBI missing. When investigating the issue last yea=
r,
it was discovered that the documented behavior does not match what the fu=
nction
actually does. Unfortunately it was overlooked that some other parts of t=
he code
actually rely on the behavior as implemented.

Some odd error messages if UBI isn't present are probably the lesser issu=
e,
so I reverted the commit for now.

Thanks,

David
