Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBQyB-0000Sz-1l
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 15:02:11 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Mon, 19 Aug 2013 15:01:42 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
 <1376923842.2089.480.camel@sauron.fi.intel.com>,
 <1376924118.2089.482.camel@sauron.fi.intel.com>
In-Reply-To: <1376924118.2089.482.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 17:55 +0300, Artem Bityutskiy wrote:=0A=
> On Mon, 2013-08-19 at 17:50 +0300, Artem Bityutskiy wrote:=0A=
> > On Mon, 2013-08-19 at 14:24 +0000, Mats K=E4rrman wrote:=0A=
> > > # echo "1" > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery=0A=
> > >=0A=
> > > However, in the latter case, the flag is reset when the file system i=
s=0A=
> > > remounted=0A=
> > > so the test continues without tst_recovery enabled.=0A=
> >=0A=
> > Ah, I see it now.=0A=
> >=0A=
> > Did you try if you can resolve the mount path into 'ubiX_Y' in integck,=
=0A=
> > so that one wouldn't need to pass this -P <loong/path/string> option?=
=0A=
> =0A=
> Check the recover_tested_fs() which uses get_tested_fs_mntent() which=0A=
> parses /proc/mounts. Can you do a similar thing and find the 'ubiX_Y'=0A=
> part, and then just write 1 to the sysfs path. -P would not be needed=0A=
> then at all.=0A=
> =0A=
=0A=
Actually this was what I first had in mind, but I stopped for the -P soluti=
on=0A=
for two reasons:=0A=
1) It saved me a lot of time ;)=0A=
2) Integck seem to be written with the aim of being a general purpose test=
=0A=
program (even if some comments in the code hint in another direction). If=
=0A=
so, it would not be safe to assume there is any ubifs/ubi folder or that th=
e=0A=
knob file is called tst_recovery. Also it is possible to mount the debugfs=
=0A=
anywhere (but i guess that could also be parsed from /proc/mounts).=0A=
=0A=
So: general or ubifs specific?=0A=
=0A=
BR // Mats=0A=
