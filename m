Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0XIa-00087w-8s
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2015 16:15:33 +0000
Received: by wmww144 with SMTP id w144so76726856wmw.0
 for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2015 08:15:10 -0800 (PST)
Subject: Re: [PATCH 1/3] spi: core: add max_msg_size to spi_master
To: Mark Brown <broonie@kernel.org>
References: <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F7D4.1090209@gmail.com> <20151122131626.GN26072@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <5651EA08.5090400@gmail.com>
Date: Sun, 22 Nov 2015 17:15:04 +0100
MIME-Version: 1.0
In-Reply-To: <20151122131626.GN26072@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.11.2015 um 14:16 schrieb Mark Brown:
> On Sun, Nov 22, 2015 at 12:01:40AM +0100, Heiner Kallweit wrote:
>> Add a member to spi_master allowing to better handle
>> SPI chips with a message size HW limit.
> 
> How many devices have an actual message size limit (as opposed to a
> transfer size limit)?  It seems like the restrictions here are really on
> transfer sizes and that we probably want a second limit for devices that
> aren't able to deal with multiple transfers independently.
> 
To avoid misunderstandings:
For fsl-espi the length of a SPI transfer has to be programmed (max 64K)
and after this number of bytes has been transferred CS is deselected
internally. There's no way to control CS directly.
Do you consider this a message or transfer size limit?
To me this seems to be exactly what you describe as "devices that aren't
able to deal with multiple transfers independently".

> For slightly more complex things like this it probably also makes sense
> to use an accessor - I can see us wanting to combine restrictions from
> DMA engines into restrictions for the SPI controller for example.  That
> gives us a bit of insulation between the clients and the API.
> 
When you talk about accessors do you think of hooks in spi_master so that
each controller driver can provide its own implementation of e.g.
something like get_max_msg_size()?
