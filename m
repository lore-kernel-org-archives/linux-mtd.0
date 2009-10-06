Message-ID: <4ACB0B6A.8080302@nokia.com>
Date: Tue, 06 Oct 2009 12:18:34 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] MTD: OneNAND: move erase method to a separate function
References: <1254819360-17191-1-git-send-email-ext-mika.2.korhonen@nokia.com>	
	<1254819360-17191-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<9c9fda240910060213s7a2eff22icbf5d5f81431eb48@mail.gmail.com>
In-Reply-To: <9c9fda240910060213s7a2eff22icbf5d5f81431eb48@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> On Tue, Oct 6, 2009 at 5:55 PM, Mika Korhonen
> <ext-mika.2.korhonen@nokia.com> wrote:
>   
>> Separate the actual execution of erase to a new function:
>> onenand_block_by_block_erase(). This is done in preparation for
>> the multiblock erase support.
>>
>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>> ---
>>  drivers/mtd/onenand/onenand_base.c |  143 +++++++++++++++++++++---------------
>>  1 files changed, 84 insertions(+), 59 deletions(-)
>>     
[...]
>>        /* Do call back function */
>>        if (!ret)
>> +               instr->state = MTD_ERASE_DONE;
>>                mtd_erase_callback(instr);
>>     
>
> Are you missing curly braces { } here?
>
> Thank you
> Kyungmin Park
>   
Yes, I am. Thanks!

br
Mika
