Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg7d4-0004Az-0p
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 08:48:19 +0000
Subject: Re: UBIFS recovery/forensics tools
To: Andrew Tierney <cybergibbons@cybergibbons.com>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
References: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
 <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
 <56075420.5080303@cn.fujitsu.com>
 <CAK__sc7xduxq62DVw6fQeNZtXeYbzDmmjw3ms2b8ZgF96j6bhQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5607AD39.60305@nod.at>
Date: Sun, 27 Sep 2015 10:47:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAK__sc7xduxq62DVw6fQeNZtXeYbzDmmjw3ms2b8ZgF96j6bhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.09.2015 um 10:37 schrieb Andrew Tierney:
> I suspect a fsck utility will work quite well for a number of these.
> 
> I guess the real issue is that as soon as any piece of data deviates
> from the norm, current tools fall over rather than attempting to
> recover. ubi_reader has verbose output that allows some degree of
> tweaking, but it can still be awkward.
> 
> The current issue I am working on is that I have one image with two
> volumes contained within. The first volume can be recovered fine, but
> the second starts walking the index, reads a common header, an ino,
> and then stops. I can observe significant data in the remainder of the
> file. There is no other location on the system for a root directory,
> so I suspect that the index is being misread. I don't yet know enough
> about UBIFS to describe the issue better.

Can you share the image?

I hope I have something sane to release soon.
...being still busy with rebasing my preliminary tool to Yang's tree
and found some issues.

Thanks,
//richard
