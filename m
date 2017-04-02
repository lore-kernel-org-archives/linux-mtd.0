Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cukIk-0001Cm-SM
 for linux-mtd@lists.infradead.org; Sun, 02 Apr 2017 18:32:36 +0000
Received: by mail-wr0-x22b.google.com with SMTP id w11so139775981wrc.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Apr 2017 11:32:11 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] mtd: spi-nor: parse SFDP tables to setup (Q)SPI
 memories
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 jartur@cadence.com, kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
 <ed497188-b50a-8212-a04b-1f25e8b3e260@wedev4u.fr>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <07c1286d-3061-196a-d57d-db5d3619d4d2@gmail.com>
Date: Sun, 2 Apr 2017 20:32:08 +0200
MIME-Version: 1.0
In-Reply-To: <ed497188-b50a-8212-a04b-1f25e8b3e260@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2017 06:45 PM, Cyrille Pitchen wrote:
> Hi all,
> 
> Le 23/03/2017 à 00:33, Cyrille Pitchen a écrit :
>> Hi all,
>>
>> based on git-hub/spi-nor and likely applicable on linux-next within the
>> next few days.
>>
>>
>> This new series of patchs aims to upgrade to spi-nor framework. We need to
>> take into account latest SPI memories which cannot be handled correctly by
>> the current implementation.
>>
>> For instance, SPI NOR memories like Spansion S25FS512S or Macronix
>> MX25U4035 support only the Fast Read 1-4-4 (EBh) command but not the
>> Fast Read 1-1-4 (6Bh) command. However the current spi-nor framework
>> supports only Fast Read 1-1-4 (6Bh).
>>
>> Also the Spansion S25FS512S memory (and others) may use a non-uniform
>> sector erase map, whereas the spi-nor framework assumes that a single
>> sector erase size and opcode can be used anywhere inside the data array.
>> This assumption is no longer valid.
>>
>> Then parsing SFDP tables is an attempt to solve many of those issues by
>> discovering dynamically most of the parameters and settings of the SPI NOR
>> memory:
>> - the flash size
>> - the page size for Page Program commands
>> - the supported Fast Read commands with the associated opcodes and number
>>   of mode/wait-state (dummy) cycles.
>> - the supported Sector/Block Erase commands with the associated opcodes
>>   and sizes.
>> - the erase sector map (for non-uniform memory).
>>
>>
>> Besides, most QSPI controllers from the different vendors are capable to
>> support the SPI 1-2-2 and 1-4-4 protocols but the spi-nor framework was
>> not ready to use them. This series also fixes this issue and computes the
>> best match between the hardware capabilies of both the SPI memory and the
>> SPI controler (master) to select the right opcodes and dummy cycles for
>> Fast Read and Page Program operations.
>>
>> The new 'struct spi_nor_hwcaps' uses a bitmask to describe all the
>> supported hardware capabilies and makes the difference between Fast Read
>> and Page Program operations and also between the different SPI protocols
>> (SPI 1-1-2 vs SPI 1-2-2 or SPI 1-1-4 vs SPI 1-4-4).
>>
>>
>> IMHO, the first 3 patches of this series are ready to be merged into the
>> github/spi-nor tree. Marek, do you agree with that?
> 
> Marek, if you have no comment on them, I will merge patches 1, 2, 3 in
> the spi-nor tree within the next few days. Hence, people like Cédric
> waiting for the series to merged could base their work on these patches.

Hm well, you could've at least poked me about this, I was so snowed
under that I didn't have any chance to take a look :(

-- 
Best regards,
Marek Vasut
