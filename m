Message-ID: <4AB31084.7050904@nokia.com>
Date: Fri, 18 Sep 2009 07:45:56 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: "Hunter Adrian (Nokia-D/Helsinki)" <adrian.hunter@nokia.com>
Subject: Re: [PATCH 1/2] MTD: OneNAND: move erase method to a separate function
References: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4AB1132D.30705@nokia.com>
In-Reply-To: <4AB1132D.30705@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"dedekind@infradead.org" <dedekind@infradead.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hunter Adrian (Nokia-D/Helsinki) wrote:
> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>   
>> Separate the actual execution of erase to a new function:
>> onenand_single_block_erase()
>>
>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>> ---
>>     
>
> The patch is fine but needs some minor style changes.
>
> Also the patch description should explain that this is in
> preparation for adding multiblock erase support.
>   
Thanks for the feedback, I'll rework the patches and resend them in near 
future.

br,
Mika
