Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTccn-0002Mg-To
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 16:58:14 +0000
Message-ID: <4ECE8565.8060708@newsguy.com>
Date: Thu, 24 Nov 2011 09:56:53 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH v3 13/16] mtd/docg3: add ECC correction code
References: <1321714978-24543-1-git-send-email-robert.jarzmik@free.fr>
 <1321714978-24543-14-git-send-email-robert.jarzmik@free.fr>
 <20111124102453.GF28830@parrot.com>
In-Reply-To: <20111124102453.GF28830@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/24/2011 02:24 AM, Ivan Djelic wrote:
> On Sat, Nov 19, 2011 at 03:02:55PM +0000, Robert Jarzmik wrote:
>> Credit for discovering the BCH algorith parameters, and bit
>> reversing algorithm is to be give to Mike Dunn and Ivan
>> Djelic.
>>
>> The BCH correction code relied upon the BCH library, where
>> all data and ECC is bit-reversed. The BCH library works
>> correctly when each input byte is bit-reversed, and
>> accordingly ECC output is also bit-reversed.
>>
> Reviewed-by: Ivan Djelic <ivan.djelic@parrot.com>
>
>


Reviewed-by: Mike Dunn <mikedunn@newsguy.com>
