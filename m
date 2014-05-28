Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZPS-0001y5-LM
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:40:31 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Wed, 28 May 2014 08:40:00 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B4094CF@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
 ,<1401194249.1304.140.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>,
 <1401202545.1304.164.camel@sauron.fi.intel.com>
In-Reply-To: <1401202545.1304.164.camel@sauron.fi.intel.com>
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

On Tuesday, May 27, 2014 4:55 PM, Artem Bityutskiy wrote:=0A=
> How about this compromise solution which should be simple enough to=0A=
> implement, but I am not sure it is good enough to you.=0A=
> =0A=
> Change -p so that it takes an _argument_. The argument should be a path=
=0A=
> to the debugfs file which controls the power cuts emulation. This can be=
=0A=
> either global or the per-FS switch.=0A=
> =0A=
> All the test will do is writing '1' to this file as soon as it starts,=0A=
> and as soon as it mounts or re-mounts the FS.=0A=
> =0A=
> Now, it is your choice which file path to give - the global or the=0A=
> per-FS.=0A=
=0A=
I guess you mean something in the line of=0A=
http://comments.gmane.org/gmane.linux.drivers.mtd/47872=0A=
=0A=
;-) // Mats=0A=
