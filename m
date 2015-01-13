Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB9HW-0006lt-2z
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 21:45:46 +0000
Received: by mail-lb0-f169.google.com with SMTP id p9so4935114lbv.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 13:45:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150113185153.GT9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
Date: Tue, 13 Jan 2015 19:45:22 -0200
Message-ID: <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, Jan 13, 2015 at 4:51 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

>> - Read the two flashes.
>
> Are you doing any verification to make sure you're reading the *correct*
> data? I'd imagine from some what I see in your patches, that you might
> actually be reading from the wrong flash.

Yes, you are right. Just confirmed that with this v3 applied I erased
/dev/mtd0, but that also incorrectly erased /dev/mtd1.

Now I came back to the original v1 patch: isn't it the simpler
approach for fixing the module load/unload crash problem?

It only keeps the mtd unregistration index in sync with registration
and doesn't touch other areas of the driver.

IMHO it is an improvement over the current situation.

I agree that this driver needs more rework, but I am not able to put
it on such good state.

Please let me know your opinion.

Thanks,

Fabio Estevam
