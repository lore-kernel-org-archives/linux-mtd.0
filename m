Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlzSp-0000h8-RJ
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:08:56 +0000
Message-ID: <5297242B.3040807@ti.com>
Date: Thu, 28 Nov 2013 16:38:27 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 12/17] spi/qspi: convert driver to enable/disable memory
 mapped.
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-13-git-send-email-sourav.poddar@ti.com>
 <20131126131138.GJ14725@sirena.org.uk> <5296D37C.2020003@ti.com>
 <20131128104922.GK14725@sirena.org.uk>
In-Reply-To: <20131128104922.GK14725@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 28 November 2013 04:19 PM, Mark Brown wrote:
> On Thu, Nov 28, 2013 at 10:54:12AM +0530, Sourav Poddar wrote:
>
>> At the beginning of this api, I am doing a "disable memory mapped",
>> as becuase of
>> the code implemntation, if the control has reaches this api, memory
>> mapped is not
>> the desired operation. Then, at the end of this api after
>> "spi_finalize_current_message(master)", which indicated the current
>> transfer complete, I
>> issue a end of transfer command. Only after which, I enable memory
>> mapped mode again.
>> So, will the condition you mention above will hit.? Please help me
>> understand if i am
>> missing something?
> Removing the mapping isn't going to stop another context which has
> obtained a handle on the map trying to look at the mapping.
hmm..so the  'memcpy' part should be made atomic.(if possible?).
