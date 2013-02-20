Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U7xWV-0003V6-0N
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 00:27:00 +0000
Received: by mail-ve0-f172.google.com with SMTP id cz11so6437897veb.17
 for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2013 16:26:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2131687.FmJCQHlDMX@ws-stein>
References: <2131687.FmJCQHlDMX@ws-stein>
Date: Tue, 19 Feb 2013 16:26:54 -0800
Message-ID: <CAN8TOE-eWhvVF_c48548HeA9OZ4D5Mp0xSLJBz9RsdTYwPRqOg@mail.gmail.com>
Subject: Re: mtdoops: helper application for readout?
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Richard Purdie <rpurdie@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 14, 2013 at 3:40 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> is there already some helper application which can shows the stored oops/panics with mtdoops?

After a bit of googling, it looks like there are scattered URL
references to a no-longer-available "oopslog.c", written by the author
of mtdoops, Richard Purdie. I CC'd him at his last-known address from
the git logs, but he doesn't seem to have touched this in a while.

AFAIK, the output from mtdoops is just plain text data (not
compressed), so you can just dump it straight from the /dev/mtdX
(where X is the MTD number) with something like 'cat /dev/mtdX'. Of
course, that will not account for when the ring buffer wraps around
nor if there are bad blocks.

Brian

P.S. With a little more digging, I found a source tarball in the Maemo
archives that contains oopslog.c. It's a very simple program, and I
haven't tested it. Use at your own risk:

http://maemo.org/packages/view/sp-oops-extract/

http://repository.maemo.org/pool/maemo5.0/free/s/sp-oops-extract/sp-oops-extract_0.0.7-1.tar.gz
