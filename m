Received: from webbox1416.server-home.net ([77.236.96.61])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U87GV-00067p-Jp
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 10:51:08 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: mtdoops: helper application for readout?
Date: Wed, 20 Feb 2013 11:51:03 +0100
Message-ID: <7338404.JWk7Kpzi9Q@ws-stein>
In-Reply-To: <CAN8TOE-eWhvVF_c48548HeA9OZ4D5Mp0xSLJBz9RsdTYwPRqOg@mail.gmail.com>
References: <2131687.FmJCQHlDMX@ws-stein>
 <CAN8TOE-eWhvVF_c48548HeA9OZ4D5Mp0xSLJBz9RsdTYwPRqOg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org, Richard Purdie <rpurdie@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 19 February 2013 16:26:54, Brian Norris wrote:
> On Thu, Feb 14, 2013 at 3:40 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> > is there already some helper application which can shows the stored oops/panics with mtdoops?
> 
> After a bit of googling, it looks like there are scattered URL
> references to a no-longer-available "oopslog.c", written by the author
> of mtdoops, Richard Purdie. I CC'd him at his last-known address from
> the git logs, but he doesn't seem to have touched this in a while.
> 
> AFAIK, the output from mtdoops is just plain text data (not
> compressed), so you can just dump it straight from the /dev/mtdX
> (where X is the MTD number) with something like 'cat /dev/mtdX'. Of
> course, that will not account for when the ring buffer wraps around
> nor if there are bad blocks.
> 
> Brian
> 
> P.S. With a little more digging, I found a source tarball in the Maemo
> archives that contains oopslog.c. It's a very simple program, and I
> haven't tested it. Use at your own risk:
> 
> http://maemo.org/packages/view/sp-oops-extract/
> 
> http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract/sp-oops-extract_0.0.7-1.tar.gz

Ah, sp-oops-extract seems to be what I looked for. Thanks a lot!

Alexander
