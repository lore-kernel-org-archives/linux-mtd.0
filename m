Received: from mail-pb0-f44.google.com ([209.85.160.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCm6z-0008Gx-JZ
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 07:16:34 +0000
Received: by mail-pb0-f44.google.com with SMTP id wz12so4028969pbc.31
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 23:16:31 -0800 (PST)
Message-ID: <51359BA5.3060306@gmail.com>
Date: Mon, 04 Mar 2013 23:15:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: Diskonchip regression
References: <1362389632.763807690@f177.mail.ru>
In-Reply-To: <1362389632.763807690@f177.mail.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/04/2013 01:33 AM, Alexander Shiyan wrote:
> Hello All.

Hi Alexander,

> I want to inform about diskonchip regression.
> Mounting diskonchip partition now failed due "mtd: nand: kill NAND_NO_READRDY" commit.
>
> Bug produce infinite error messages in the console, like this:
> # mount /dev/mtdblock5 /mnt/bbox -t jffs2 -o rw
> # jffs2: notice: (45) check_node_data: wrong data CRC in data node at 0x00f14f98: read 0xa0fcbcc1, calculated 0xc30e1a36.
> jffs2: mtd->read(0x567 bytes from 0xf14a00) returned ECC error
> jffs2: notice: (45) check_node_data: wrong data CRC in data node at 0x00f14924: read 0x73ba55cc, calculated 0x12ecdd4b.
> jffs2: mtd->read(0x724 bytes from 0xf14200) returned ECC error
> ...
>
> I found point to bug using "git bisect":
> shc@shc /home/git/linux-next $ git bisect log
> git bisect start
...

> git bisect bad 3d059693f6e0489066a98f455601137fa003df77
> shc@shc /home/git/linux-next $ git bisect bad
> 1696e6bc2ae83734e64e206ac99766ea19e9a14e is the first bad commit
> commit 1696e6bc2ae83734e64e206ac99766ea19e9a14e
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Tue May 22 23:50:00 2012 -0700
>
>      mtd: nand: kill NAND_NO_READRDY
>
>      According to its documentation, the NAND_NO_READRDY option is always used
>      when autoincrement is not supported. Autoincrement support was recently
>      dropped, so we can drop this options as well (defaulting to "no read ready
>      check").
>
>      Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>      Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>      Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
>
> :040000 040000 5bf782761ebf2573393a9900b18f18901855be90 9633fd4d5e881a7d504c3f55656857f0f8d64052 M       drivers
> :040000 040000 d8bdeae25e074d3cc915321e0612d666bf692e0a d9de9de1e651791832265d9492f7e794d377d948 M       include
>
> So, should we revert this commit or find another solution?

Including a CC for the author would have been nice :) I found this only 
because you commented about DoC on another thread.

Does your DoC use small page size (i.e., 512B)? Can you provide a little 
more information regarding the NAND chip used (e.g., any of 
manufacturer, part number, page/eraseblock/device size, etc.), so I can 
document this a little better?

Anyway, I believe I overlooked some things in that patch. The original 
documentation for NAND_NO_READRDY included "True for all large page 
devices, as they do not support autoincrement." I was conflating "not 
support autoincrement" with the NAND_NO_AUTOINCR option, which was in 
fact doing nothing. But of course that didn't mean NAND_NO_READRDY was 
doing nothing...

I would recommend a revert (probably sent to stable). I can send this as 
an explicit patch myself soon, if given a little more info. Sorry for 
the bug!

Brian
