Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9cPU-0003x7-JS
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 15:55:25 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com>
 <53C6618F.3010707@huawei.com> <874myan0no.fsf@nbsps.com>
 <53CE1D97.6010609@huawei.com>
Date: Tue, 22 Jul 2014 11:42:51 -0400
In-Reply-To: <53CE1D97.6010609@huawei.com> (hujianyang@huawei.com's message of
 "Tue, 22 Jul 2014 16:15:19 +0800")
Message-ID: <87bnshl7r8.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 Jul 2014, hujianyang@huawei.com wrote:

> I've read your code.  This code shows me a better way to get EC header
> and VID header than my 'ioctl' design. Thanks~!

> I think my former work started in a wrong way. Using MTD functionality
> as yours seems better to develop a new utility we want.

> So in the next step, I would like to resend a new patch set which just
> read fs data by mtd_read(). I think a new ioctl is needed to translate
> specified eraseblock num from lnum to pnum.

The code I sent is not very clear on this.  However, the variables
'eba_map' and 'pba_map' are static arrays that do this mapping.
Basically, the algorithm is,

  for each erase block,
    read EC header.
    if(EC good) 
       read VID header
       if(VID good)
         place_in_map().

The structure of the base UBI is very simple.  An issue the code I sent
doesn't handle is when two headers map to the same 'logical block'.  The
'sqnum' should resolve this.

   place_in_map()
     if(LEB empty)
      map PEB.
     else if(LEB sqnum < new sqnum) /* care of wrapping or large change? */
      map new PEB to LEB.

For this utility, we might wish to keep the older PEB around in case the
current version is corrupt at a higher (UbiFS) layer or maybe not.
However, writing our own layer gives this flexibility and we don't have
to add code to the Linux MTD layers.  More importantly, the utility will
not need (a compatible) Linux MTD layer on the host machine to check the
UBI/UbiFs dump, if we can do this without an 'ioctl()'.

Thanks for attempting this.  I think many people realize the value of
such a tool.

Regards,
Bill Pringlemeir.
