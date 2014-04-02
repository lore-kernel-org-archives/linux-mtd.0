Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVSTI-0000Cc-4c
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 21:13:21 +0000
Received: by mail-vc0-f176.google.com with SMTP id lc6so1153062vcb.21
 for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2014 14:12:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <533BC826.9010504@intracom-telecom.com>
References: <533BC826.9010504@intracom-telecom.com>
Date: Wed, 2 Apr 2014 23:12:57 +0200
Message-ID: <CAFLxGvy0Fu9G8mizuxzA5OBS8URR-5YnA_Fn9+3n-uFbO4mdDA@mail.gmail.com>
Subject: Re: UBIFS and High Availability schemes
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Apostolos Manolitzas <manap@intracom-telecom.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 2, 2014 at 10:19 AM, Apostolos Manolitzas
<manap@intracom-telecom.com> wrote:
> Hello all,
>
> I am in the middle of researching for technical options for high
> availability (replication mainly) between two systems with NAND
> flash(UBIFS). I found the file systems drbd <http://www.drbd.org/> and
> GlusterFS <http://www.gluster.org/>  but I didn't have much success on
> configuring drbd above UBIFS. In the UBI FAQ, it  notes that doesn't
> support NFS but it's the same for the drbd?

DRBD works on top of block devices, not MTD.

-- 
Thanks,
//richard
