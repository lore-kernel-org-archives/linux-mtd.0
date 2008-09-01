Message-ID: <48BBD12C.2080506@nokia.com>
Date: Mon, 01 Sep 2008 14:25:32 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH resend] MTD: nandsim: allow changing some module	parameters
References: <20080728070626.4707.99096.sendpatchset@localhost.localdomain>	
	<20080728070631.4707.68077.sendpatchset@localhost.localdomain>
	<1220268404.2982.65.camel@pmac.infradead.org>
In-Reply-To: <1220268404.2982.65.camel@pmac.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Mon, 2008-07-28 at 10:06 +0300, Artem Bityutskiy wrote:
>> Grant write permissions to some nandsim module parameters
>> to make it possible to change them runtime e.g., via sysfs:
>>
>> echo 1 > /sys/module/nandsim/parameters/rptwear
>>
>> There is no reason to have that file read-only. This patches
>> also changes the permissions from octal to S_* format.
>>
>> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Got a current version of this?

Please, do not apply this for now. I'll send a better version
later. This version has a problem - we should make sure
rptwear-related variables are initialized.

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
