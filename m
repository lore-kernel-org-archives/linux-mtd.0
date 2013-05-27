Received: from 81-89-104-214.blue.kundencontroller.de ([81.89.104.214]
 helo=tomweber.eu)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UgsiD-0000mV-5I
 for linux-mtd@lists.infradead.org; Mon, 27 May 2013 08:23:25 +0000
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: Fastmap: Fix memory leak
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 27 May 2013 10:22:32 +0200
From: Thomas Weber <thomas@tomweber.eu>
In-Reply-To: <51A3150C.7080009@nod.at>
References: <CAFLxGvw5gj-dfQeMKQVJpHPAXi4ZeNTaG3u3yXOAkshJRavXVA@mail.gmail.com>
 <1369641744-13534-1-git-send-email-thomas@tomweber.eu>
 <51A3150C.7080009@nod.at>
Message-ID: <03cfc90681a75058e41a4d80a8c33f2f@tomweber.eu>
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

Hello,

On 2013-05-27 10:10, Richard Weinberger wrote:
> Hi!
> 
> Am 27.05.2013 10:02, schrieb Thomas Weber:
>> Signed-off-by: wang bo <wang.bo116@zte.com.cn>
>> 
>> [fix whitespace errors]
>> 
>> Tested with linux-v3.10-rc3 on Devkit8000.
>> Signed-off-by: Thomas Weber <thomas@tomweber.eu>
>> 
>> The discussion about this patch can be found:
>> https://lkml.org/lkml/2013/5/2/118
> 
> Thanks a lot for fixing the whitespace issues!
> Am I allowed to add a Tested-by: Thomas Weber <thomas@tomweber.eu>?
> IOW did you test the patch? :D

You can add my Tested-by.
Thomas

> 
> Thanks,
> //richard
