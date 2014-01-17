Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W41o2-0007Nr-BC
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 05:17:23 +0000
Received: by mail-wi0-f174.google.com with SMTP id g10so226142wiw.7
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 21:16:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140116213206.GG8919@ld-irv-0074>
References: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
 <20140116213206.GG8919@ld-irv-0074>
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Date: Fri, 17 Jan 2014 10:46:38 +0530
Message-ID: <CA+V-a8u42eNcDoSr42Bq-3JJEdFMXjru-PDpmXqjZEzkoQ=efQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: davinci_nand: Remove unnecessary labels from error
 path
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, Jan 17, 2014 at 3:02 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jan 15, 2014 at 01:38:26PM +0530, Prabhakar Lad wrote:
>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>
>> This patch removes the unnecessary labels from
>> the error path in probe function which did nothing
>> than just returning error values, Thus simplifying code
>> path and improved readability.
>>
>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>
> This does not apply to my branch, since some OOM messages have been
> dropped. Can you rebase on l2-mtd.git (or linux-next)?
>
OK I'll rebase it against linux-next and post a v2.

Thanks,
--Prabhakar Lad
