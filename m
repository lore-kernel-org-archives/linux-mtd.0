Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUfm9-0000kN-66
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 17:13:33 +0000
Received: by mail-pa0-f50.google.com with SMTP id kq14so8534829pab.9
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 10:13:12 -0700 (PDT)
Date: Mon, 31 Mar 2014 10:13:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
Message-ID: <20140331171307.GF29542@ld-irv-0074>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395733934.1549.46.camel@sauron.fi.intel.com>
 <20140329202457.GA742@arch.cereza>
 <1396259134.9016.58.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396259134.9016.58.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 31, 2014 at 12:45:34PM +0300, Artem Bityutskiy wrote:
> On Sat, 2014-03-29 at 17:24 -0300, Ezequiel Garcia wrote:
> > Thanks! Do you think it would be appropriate to do a new release, so
> > the new tool is included?
> 
> Yeah, probably. Let's check if Brian has anything in mind and then I can
> make a release.

Other than the trivial ubiformat patch I just sent, no objections here.
A release is probably a good idea.

(NB: I just upgraded my rootfs mtd-utils to the latest git HEAD a week
or two ago; I suppose a release tag would have been better!)

Brian
