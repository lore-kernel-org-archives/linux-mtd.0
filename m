Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBRWo-0001oj-AQ
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 15:37:59 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Mon, 19 Aug 2013 15:37:29 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC77F@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
 <1376923842.2089.480.camel@sauron.fi.intel.com>
 ,<1376924118.2089.482.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>,
 <1376925394.2089.491.camel@sauron.fi.intel.com>
In-Reply-To: <1376925394.2089.491.camel@sauron.fi.intel.com>
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

On Mon, 2013-08-19 at 15:16 +0000, Artem Bityutskiy wrote:=0A=
> OK, but there is also an "fstype" field, could you use and do the trick=
=0A=
> only for UBIFS?=0A=
=0A=
I guess so, but there is also an alternative mounting syntax:=0A=
=0A=
# mount -t ubifs ubi0:integ_chk /mnt/ubifs=0A=
=0A=
resulting in a /proc/mounts line of:=0A=
=0A=
ubi0:integ_chk /mnt/ubifs ubifs rw,relatime 0 0=0A=
=0A=
Do you see an easy way to resolve this into ubi0_0 or should this case=0A=
also be ignored?=0A=
Personally I have never seen the use of multiple ubi volumes inside of=0A=
one mtd partition so "0" could be assumed but someone else might=0A=
disagree.=0A=
=0A=
BR // Mats=0A=
