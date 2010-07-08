Subject: Re: Possible bug in onenand_base ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Enric =?ISO-8859-1?Q?Balletb=F2?= i Serra <eballetbo@gmail.com>
In-Reply-To: <AANLkTin43tv-AiFjwNkUE7ijy_ADMtsZTrqo_PY3DpCE@mail.gmail.com>
References: <u2v70c9a9111004300305n4c86774bm7ed70161ad72d830@mail.gmail.com>
	<z2p9c9fda241005052046j3fea69a4v91f3d5fd86648fac@mail.gmail.com>
	<k2x70c9a9111005060422v90e246daw19b1f71d57a890a1@mail.gmail.com>
	<g2x9c9fda241005060444x7f9c4360u334d3afb06f1e8b8@mail.gmail.com>
	<z2v70c9a9111005060602n7b7477ebueb197af05372bd5@mail.gmail.com>
	<AANLkTimwO5iU6zPUJeLwAxW3GZGz5ldSRLmp2vpTBem3@mail.gmail.com>
	<AANLkTiktbqSHHw572y1YGVw7XhZaim9Pg3lhoMmDBLXY@mail.gmail.com>
	<AANLkTin43tv-AiFjwNkUE7ijy_ADMtsZTrqo_PY3DpCE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 12:58:07 +0300
Message-ID: <1278583087.20321.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
	Kyungmin Park <kmpark@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-08 at 11:55 +0200, Enric Balletbò i Serra wrote:
> Hello,
> 
> I made new tests regarding this issue. Looks like the problem is
> reading from the OneNAND device.

Did you try older kernel and then bisecting who is responsible for the
breakage?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
