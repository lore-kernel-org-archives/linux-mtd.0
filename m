Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xb3GY-0005tg-JL
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 08:03:35 +0000
Date: Mon, 6 Oct 2014 09:55:56 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd: ubi: Extend UBI layer debug/messaging capabilities
In-Reply-To: <1412353168.10105.5.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.02.1410060954360.17221@lnxricardw1.se.axis.com>
References: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
 <1412350035.3795.101.camel@sauron.fi.intel.com>
 <CACna6ryws=d_7NXhzWyu34TaV+Yv8y0+D4Q0ewuzDEv=8xDxRg@mail.gmail.com>
 <1412353168.10105.5.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 3 Oct 2014, Artem Bityutskiy wrote:

> I respect checkpatch.pl, and uniformity / consistency, but in this
> particular case I put my maintainer hat on and say that for this kernel
> subsystem it is fine, because the maintainer will be more efficient in
> maintaining this code when the code is a bit mere readable for him.

I believe checkpatch.pl flags long lines as a warning, not as an error, 
indicating some relaxation on the severity to start with.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
