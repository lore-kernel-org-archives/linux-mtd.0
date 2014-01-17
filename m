Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W44D0-0001W4-Gg
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 07:51:19 +0000
Received: by mail-we0-f170.google.com with SMTP id u57so4237305wes.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 23:50:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+V-a8u42eNcDoSr42Bq-3JJEdFMXjru-PDpmXqjZEzkoQ=efQ@mail.gmail.com>
References: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
 <20140116213206.GG8919@ld-irv-0074>
 <CA+V-a8u42eNcDoSr42Bq-3JJEdFMXjru-PDpmXqjZEzkoQ=efQ@mail.gmail.com>
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Date: Fri, 17 Jan 2014 13:20:36 +0530
Message-ID: <CA+V-a8sNSKX_W43G7A0zFKq1GX7k25XR2ZxVtxiQyAmLD5Rs4w@mail.gmail.com>
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

Hi Brain,

On Fri, Jan 17, 2014 at 10:46 AM, Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:
> Hi Brian,
>
> On Fri, Jan 17, 2014 at 3:02 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> On Wed, Jan 15, 2014 at 01:38:26PM +0530, Prabhakar Lad wrote:
>>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>>
>>> This patch removes the unnecessary labels from
>>> the error path in probe function which did nothing
>>> than just returning error values, Thus simplifying code
>>> path and improved readability.
>>>
>>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>>
>> This does not apply to my branch, since some OOM messages have been
>> dropped. Can you rebase on l2-mtd.git (or linux-next)?
>>
> OK I'll rebase it against linux-next and post a v2.
>
My Bad was too late, there is already a patch fixing the above issue
in linux-next
please ignore this patch.

Thanks,
--Prabhakar Lad
