Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKlhS-0002St-87
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 14:54:27 +0000
Date: Thu, 8 Nov 2018 15:54:14 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/7] mtd: spi-nor: add restriction for nmaps in smpt parser
Message-ID: <20181108155414.48b64084@bbrezillon>
In-Reply-To: <4de81d92-ca8e-34f1-55b2-ef1b6b9dcec7@microchip.com>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
 <20181108110653.21063-4-tudor.ambarus@microchip.com>
 <20181108135447.36a0314c@bbrezillon>
 <86d16e39-15df-c12c-7bf3-25996db0c3a9@microchip.com>
 <20181108151509.364e3a85@bbrezillon>
 <4de81d92-ca8e-34f1-55b2-ef1b6b9dcec7@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Nov 2018 14:48:11 +0000
<Tudor.Ambarus@microchip.com> wrote:
  
> >>>> +    
> >>>
> >>> Maybe I missed something but it sounds like this change is just
> >>> optimizing the SPMT parsing a bit, and to be honest, I'm not sure this
> >>> is really needed. Most of the time, smpt_len will be rather small, so
> >>> trying to bail out earlier is not bringing much perf improvements.    
> >>
> >> It's rather a smtp validity check. I want to return an error if there are not
> >> enough detection commands to identify the map id.  
> > 
> > You would have failed the same way without this validity check after a
> > maximum of smpt_len iterations, right?
> >   
> 
> Right. The correct fix would be to count nmaps in a loop, then do these checks,
> and if all ok, search for the map_id in another loop :).

Or just error out when !ncmds && nmaps > 1.

If you insist on keeping the ncmds && nmaps >= (1 << (ncmds + 1))
check, that's fine, but it's not replacing the consistency check I was
doing ;-).
