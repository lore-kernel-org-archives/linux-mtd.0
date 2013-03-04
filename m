Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCb38-0001vB-Np
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:27:55 +0000
Received: by mail-vc0-f175.google.com with SMTP id p1so3004627vcq.6
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:27:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <51346287.9010801@freescale.com>
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
 <1360684037.12703.117.camel@sauron.fi.intel.com>
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
 <1362234094.2745.9.camel@sauron> <513437DF.2030505@freescale.com>
 <1362383434.2943.5.camel@sauron> <5134566C.2090405@freescale.com>
 <1362385446.2943.7.camel@sauron> <51345DFA.7070601@freescale.com>
 <1362386776.2943.11.camel@sauron> <51346287.9010801@freescale.com>
Date: Mon, 4 Mar 2013 11:27:49 -0800
Message-ID: <CAN8TOE_pE7o8hmiprs++tW_SpjKrT6if84-tY=ZW5TbtNiFTog@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 12:59 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA03=D4=C204=C8=D5 16:46, Artem Bityutskiy =D0=B4=B5=C0:
>
>> Thanks, I forgot we have this great table. BTW, please, do not forget to
>> update it with information about these 4 chip you are adding,
>> irrespective of the solution we end up with.
>
> I also want to update the table, but i do not know how to do it.

You can send patches against the mtd-www.git repo. It's just a CSV
text-file, so you'd add a few rows. I'll try to review / ack any
patches.

Brian
