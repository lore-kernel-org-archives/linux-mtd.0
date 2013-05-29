Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhfQk-0004hY-0W
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:24:39 +0000
Message-ID: <1369830446.24286.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fastmap: Fix memory leak
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 29 May 2013 15:27:26 +0300
In-Reply-To: <51A3150C.7080009@nod.at>
References: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
 <1369641744-13534-1-git-send-email-thomas@tomweber.eu>
 <51A3150C.7080009@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, wang bo <wang.bo116@zte.com.cn>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Weber <thomas@tomweber.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-27 at 10:10 +0200, Richard Weinberger wrote:
> Hi!
> 
> Am 27.05.2013 10:02, schrieb Thomas Weber:
> > Signed-off-by: wang bo <wang.bo116@zte.com.cn>
> >
> > [fix whitespace errors]
> >
> > Tested with linux-v3.10-rc3 on Devkit8000.
> > Signed-off-by: Thomas Weber <thomas@tomweber.eu>
> >
> > The discussion about this patch can be found:
> > https://lkml.org/lkml/2013/5/2/118
> 
> Thanks a lot for fixing the whitespace issues!
> Am I allowed to add a Tested-by: Thomas Weber <thomas@tomweber.eu>?
> IOW did you test the patch? :D

Did you intend to re-send the patch with all the tags at proper places?

-- 
Best Regards,
Artem Bityutskiy
