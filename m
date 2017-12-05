Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMJYw-00056g-GO
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 20:11:32 +0000
Subject: Re: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
To: Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
References: <1512340584-26894-1-git-send-email-festevam@gmail.com>
 <20171204223624.gd3iiha3qyr7nwxg@rob-hp-laptop>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <dfff2b1c-d0de-c21a-9a4c-e83ac68a106e@wedev4u.fr>
Date: Tue, 5 Dec 2017 21:11:02 +0100
MIME-Version: 1.0
In-Reply-To: <20171204223624.gd3iiha3qyr7nwxg@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 04/12/2017 à 23:36, Rob Herring a écrit :
> On Sun, Dec 03, 2017 at 08:36:24PM -0200, Fabio Estevam wrote:
>> From: Fabio Estevam <fabio.estevam@nxp.com>
>>
>> In order to improve the bindings documentation, explicitly pass the name
>> of the clocks: "qspi_en" and "qspi", which are mandatory.
>>
>> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Applied to the spi-nor/next branch of l2-mtd

Thanks!
