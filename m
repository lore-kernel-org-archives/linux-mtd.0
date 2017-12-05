Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMJhk-0001rZ-CF
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 20:20:38 +0000
Subject: Re: [PATCH v2] drivers:mtd:spi-nor:checkup FSR error bits
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <03b5686314b54957b673cdf092b11c02@SIWEX5A.sing.micron.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <763dca19-e290-537d-3008-66d00e796875@wedev4u.fr>
Date: Tue, 5 Dec 2017 21:20:11 +0100
MIME-Version: 1.0
In-Reply-To: <03b5686314b54957b673cdf092b11c02@SIWEX5A.sing.micron.com>
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

Le 04/12/2017 à 14:27, Bean Huo (beanhuo) a écrit :
> Hi, Cyrille
> 
>> Hi Bean,
>>
>> Le 04/12/2017 à 13:34, Bean Huo (beanhuo) a écrit :
>>> For Micron spi nor device, when erase/program operation fails,
>>> especially the failure results from intending to modify protected
>>> space, spi-nor upper layers still get the return which shows the
>>> operation succeeds. This is because current spi_nor_fsr_ready() only
>>> uses FSR bit.7 (flag status register) to check device whether ready.
>>> This patch fixs this issue by checking relevant error
>>
>> s/fixs/fixes/
>>
>>> bits in FSR.
>>> The FSR is a powerful tool to investigate the staus of
>>
>> s/staus/status/
>>
>>> device, checking information regarding what is actually doing the
>>> memory and detecting possible error conditions.
>>>
>>> Signed-off-by: beanhuo <beanhuo@micron.com>

Applied to the spi-nor/next branch of l2-mtd after correcting few typos
in the commit message and the subject line.

>>
>> Otherwise,
>> Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
>>
>> No need to resend, I'll fix these tiny issues myself :)
>>
> 
> Thanks!
> 
> // Bean Huo
> 
