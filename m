Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBksX-0002Vs-3c
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 12:17:42 +0000
Message-ID: <1377001384.2089.541.camel@sauron.fi.intel.com>
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 20 Aug 2013 15:23:04 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC77F@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
 <1376923842.2089.480.camel@sauron.fi.intel.com>
 ,<1376924118.2089.482.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>
 ,<1376925394.2089.491.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC77F@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 15:37 +0000, Mats Kärrman wrote:
> On Mon, 2013-08-19 at 15:16 +0000, Artem Bityutskiy wrote:
> > OK, but there is also an "fstype" field, could you use and do the trick
> > only for UBIFS?
> 
> I guess so, but there is also an alternative mounting syntax:
> 
> # mount -t ubifs ubi0:integ_chk /mnt/ubifs
> 
> resulting in a /proc/mounts line of:
> 
> ubi0:integ_chk /mnt/ubifs ubifs rw,relatime 0 0

OK, you are right. Here are all the possible ways to refer an UBI
volume, from comments in the 'open_ubi()' function:

 * o ubiX_Y    - mount UBI device number X, volume Y;
 * o ubiY      - mount UBI device number 0, volume Y;
 * o ubiX:NAME - mount UBI device X, volume with name NAME;
 * o ubi:NAME  - mount UBI device 0, volume with name NAME.

> Do you see an easy way to resolve this into ubi0_0 or should this case
> also be ignored?

Not sure about the easy part, but, there is libubi in mtd-utils, and
integck actually already uses it.

In libubi there are many useful helper functions which parse the ubi
sysfs directory and fetch various kind of info from it.

And you can use libubi for finding X_Y by NAME.

And it is actually easy now, when I think about this. First, you find
out the UBI device number, it is either X or 0 (let's call it 'ubinum').

Then if you have name instead of the volume number (Y), you use libubi
and resolve it like this:

libubi_t libubi; 
struct ubi_vol_info vol_info;

libubi = libubi_open();
if (!libubi) { blah-blah }

err = ubi_get_vol_info1_nm(libubi, ubinum,  name, &vol_info);
if (err) { blah-blah }

And now you have volume ID (Y) in "vol_info.vol_id".

And you construct the debugfs path.

Hmm?

> Personally I have never seen the use of multiple ubi volumes inside of
> one mtd partition so "0" could be assumed but someone else might
> disagree.

Well... I'd be happier to see something like I proposed above, if you
can submit such a patch.

-- 
Best Regards,
Artem Bityutskiy
