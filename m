Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgsWf-0000Wa-3i
 for linux-mtd@lists.infradead.org; Mon, 27 May 2013 08:11:30 +0000
Message-ID: <51A3150C.7080009@nod.at>
Date: Mon, 27 May 2013 10:10:52 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Thomas Weber <thomas@tomweber.eu>
Subject: Re: [PATCH] UBI: Fastmap: Fix memory leak
References: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
 <1369641744-13534-1-git-send-email-thomas@tomweber.eu>
In-Reply-To: <1369641744-13534-1-git-send-email-thomas@tomweber.eu>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, wang bo <wang.bo116@zte.com.cn>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 27.05.2013 10:02, schrieb Thomas Weber:
> Signed-off-by: wang bo <wang.bo116@zte.com.cn>
>
> [fix whitespace errors]
>
> Tested with linux-v3.10-rc3 on Devkit8000.
> Signed-off-by: Thomas Weber <thomas@tomweber.eu>
>
> The discussion about this patch can be found:
> https://lkml.org/lkml/2013/5/2/118

Thanks a lot for fixing the whitespace issues!
Am I allowed to add a Tested-by: Thomas Weber <thomas@tomweber.eu>?
IOW did you test the patch? :D

Thanks,
//richard
