Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c058z-0006p0-11
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 11:16:17 +0000
Received: by mail-wm0-x242.google.com with SMTP id 68so174178wmz.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 Oct 2016 04:15:56 -0700 (PDT)
Date: Fri, 28 Oct 2016 13:15:52 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [REGRESSION 4.9-rc2] "c83ed4c - ubifs: Abort readdir upon
 error" breaks mount
Message-ID: <20161028131552.16c20658@gmail.com>
In-Reply-To: <dbd2bff6-fdb9-2022-7acc-fcd1cac4c88c@nod.at>
References: <20161028113708.4d5535ba@gmail.com>
 <dbd2bff6-fdb9-2022-7acc-fcd1cac4c88c@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard

On Fri, 28 Oct 2016 11:38:55 +0200
Richard Weinberger <richard@nod.at> wrote:

> Ralph,
> 
> On 28.10.2016 11:37, Ralph Sennhauser wrote:
> > Dear Richard, dear list
> > 
> > When testing 4.9-rc2 the device wouldn't boot, as it turns out
> > commit c83ed4c9dbb358b9e7707486e167e940d48bfeed prevent's me
> > mounting root. 
> 
> A fix for this is already heading upstream:
> http://lists.infradead.org/pipermail/linux-mtd/2016-October/070023.html
> 

Coming back from lunch and having a working solution in the mail, just
beautiful. If you still need it:

Tested-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>

Much appreciated
Ralph


> Thanks,
> //richard
