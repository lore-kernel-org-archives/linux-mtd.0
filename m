Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S63tL-0004y1-QC
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 17:46:12 +0000
Received: by ghbf11 with SMTP id f11so1136897ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 09:46:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1331286099.22872.45.camel@sauron.fi.intel.com>
References: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
 <CAMjpGUc1m8D-nKVoddTehEDfx0r9R+sMTgtqxkfEG9W2Ok6-6w@mail.gmail.com>
 <CAN8TOE9yLLnV2_imd0GUbue+z0A2PNdD6Vz7qr2dYaVjsugN=w@mail.gmail.com>
 <1331286099.22872.45.camel@sauron.fi.intel.com>
Date: Fri, 9 Mar 2012 09:46:09 -0800
Message-ID: <CAN8TOE9J22ns6PdP4EWWcL3RbD4Syk7iDc6ZkSzM0FfH4-npQA@mail.gmail.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fix "make clean" for old GNU find
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 9, 2012 at 1:41 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> May be adding a one-line comment like "work-around for ancient find
> utils not supporting '+'" would also be a good idea?

Already have something similar in my patch. Will send now.

Brian
