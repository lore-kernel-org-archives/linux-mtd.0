From: "Bussery, Francois" <Francois.Bussery@arris.com>
To: "Thomas.Betker@rohde-schwarz.com" <Thomas.Betker@rohde-schwarz.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, linux-mtd
 <linux-mtd-bounces@lists.infradead.org>
Subject: Re: Deadlock issue in jffs2 (related to reverted patch "jffs2: Fix
 lock acquisition order bug in jffs2_write_begin")
Date: Fri, 1 Apr 2016 08:52:14 +0000
Message-ID: <F5C71A5F-621E-4ACE-B840-FED2DCE10399@arris.com>
References: <AD0D0F08-0871-4B7B-AEDA-DF969E0675D3@arris.com>
 <OFE6A9E412.54AAF9F2-ONC1257F85.00415EE4-C1257F85.0042B468@rohde-schwarz.com>
In-Reply-To: <OFE6A9E412.54AAF9F2-ONC1257F85.00415EE4-C1257F85.0042B468@rohde-schwarz.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <579DA19AA0E8644B860E20DEB9AACED4@arris.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After 3 days testings, I confirm that the patch works.
Thanks a lot
> On 29 Mar 2016, at 14:08, Thomas.Betker@rohde-schwarz.com wrote:
>=20
> Hello Francois:
>=20
>> I encountered same as the one that drive you to remove this patch (
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/
>> commit/fs/jffs2?id=3D157078f64b8a9cd7011b6b900b2f2498df850748)
>> Unfortunately, this patch solved some big deadlock issues in jffs2.=20
>> So, my concern is that we return back to our initial issue.
>>=20
>> So, do you have any update for this issue? May be the 2015 patch was
>> just not suffisant.=20
>=20
> David Woodhouse has provided a patch "jffs2: Fix page lock / f->sem=20
> deadlock" which was added to linux-4.5 (alternatively, you can get the=20
> patch here: http://git.infradead.org/users/dwmw2/jffs2-fixes.git).
>=20
> Hope this helps,
> Thomas
