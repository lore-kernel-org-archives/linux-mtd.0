Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeR3C-0001AL-Iw
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 14:59:15 +0000
Date: Thu, 7 Nov 2013 11:58:49 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [mtd] possible bug in nandsim
Message-ID: <20131107145848.GA32004@localhost>
References: <527B7CD1.1020105@codeaurora.org>
 <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
Cc: dedekind@infradead.org, dedekind@oktetlabs.ru,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 fastcat@gmail.com, pratibha@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard, Tanya:

On Thu, Nov 07, 2013 at 03:35:30PM +0100, Richard Weinberger wrote:
> On Thu, Nov 7, 2013 at 12:43 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> > Hi
> >
> > I've recently started working with the nand simulator. For my testing
> > purposes I have to use it with a cache file. Bellow are the commands I run:
> >
> > modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00
> > fourth_id_byte=0x15 cache_file=cache_file.txt
> > modprobe ubi mtd=0 fm_autoconvert=1
> >
> > Unfortunately, when trying the above I noticed that the next time i load
> > nandsim and ubi on top of it the fastmap data is not saved at cache_file.txt
> > and the device comes up as clean. Meaning, the cache file feature of the
> > nandsim isn't working properly.
> 
> IIRC this feature is really meant as a cache and not persistent storage.
> 

AFAIK Richard is right, the feature is just a non-persistent cache.

However a patch was submitted (and never reviewed) recently to
apparently add persistent behavior:

  http://patchwork.ozlabs.org/patch/277974/

Tanya: Can you test or review the patch and provide a formal
Tested/Reviewed-by? I'd be interested in seeing that move forward :)

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
