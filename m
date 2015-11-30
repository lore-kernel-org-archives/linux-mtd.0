Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3V1i-0007cL-EX
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:26:23 +0000
Received: by wmww144 with SMTP id w144so145885440wmw.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:26:00 -0800 (PST)
Subject: Re: [PATCH 1/3] spi: core: add max_msg_size to spi_master
To: Mark Brown <broonie@kernel.org>
References: <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F7D4.1090209@gmail.com> <20151122131626.GN26072@sirena.org.uk>
 <5651EA08.5090400@gmail.com> <20151123113846.GH1929@sirena.org.uk>
 <5658AE7C.3050507@gmail.com> <20151130164223.GE1929@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <565CAE6F.3070002@gmail.com>
Date: Mon, 30 Nov 2015 21:15:43 +0100
MIME-Version: 1.0
In-Reply-To: <20151130164223.GE1929@sirena.org.uk>
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

Am 30.11.2015 um 17:42 schrieb Mark Brown:
> On Fri, Nov 27, 2015 at 08:26:52PM +0100, Heiner Kallweit wrote:
>> Am 23.11.2015 um 12:38 schrieb Mark Brown:
> 
>>> No, for the clients so they aren't peering at the struct.
> 
>> Sure, do you think of a simple getter like this or a more complex thing?
> 
>> size_t spi_get_max_msg_size(struct spi_master *master)
>> {
>> 	return master->max_msg_size;
>> }
> 
> That's fine, the point is to allow it to get complicated later rather
> than that we have anything else to put in there right now.
> 
OK, then I'll submit an updated version of the patch.
