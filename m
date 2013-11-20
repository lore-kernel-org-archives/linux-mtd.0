Message-ID: <528D076A.8070806@ti.com>
Date: Wed, 20 Nov 2013 21:03:06 +0200
From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 2/2] memory: ti-aemif: add bindings for AEMIF driver
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1384962416-14862-3-git-send-email-ivan.khoronzhuk@ti.com>
 <20131120182102.GK14627@ns203013.ovh.net>
In-Reply-To: <20131120182102.GK14627@ns203013.ovh.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>,
 gregkh@linuxfoundation.org, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/20/2013 08:21 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> +				the chip select signal.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-wsetup:		write setup width, ns
>> +				Time between the beginning of a memory cycle
>> +				and the activation of write strobe.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-wstrobe:	write strobe width, ns
>> +				Time between the activation and deactivation of
>> +				the write strobe.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +- ti,cs-whold:		write hold width, ns
>> +				Time between the deactivation of the write
>> +				strobe and the end of the cycle (which may be
>> +				either an address change or the deactivation of
>> +				the chip select signal.
>> +				Minimum value is 1 (0 treated as 1).
>> +
>> +If any of the above parameters are absent, current parameter value will be taken
>> +from the corresponding HW reg.
>> +
>> +The name for cs node must be in format csN, where N is the cs number.
> 
> this is wired we should use reg instead to represent the cs as done for SPI
> or a an other property
> 
> Best Regards,
> J.
> 

Ok, I will add new property cs-chipselect like following :

ti,cs-chipselect:	number of chipselect. Indicates on the
			aemif driver which chipselect is used
			for accessing the memory.
			For compatibles "ti,davinci-aemif" and 
			"ti,keystone-aemif" it can be in range [0-3].
			For compatible "ti,omap-L138-aemif" range is [2-5].

Is it OK?

-- 
Regards,
Ivan Khoronzhuk
