Date: Thu, 18 Jan 2007 01:34:32 +0000 (GMT)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: OneNAND: Always print error messages
In-Reply-To: <5309548.532541169078227711.JavaMail.weblogic@ep_ml22>
Message-ID: <Pine.LNX.4.64.0701180133520.27837@pentafluge.infradead.org>
References: <5309548.532541169078227711.JavaMail.weblogic@ep_ml22>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

On Wed, 2007-01-17 at 23:57 +0000, Kyungmin Park wrote:
Yes, simple solution is separate read oob from normal and scanning.
> I think is is easy because we can use state variable, FL_SCANNING 
instead of FL_READING in bbt.
> I will try it.
>
I meant something like this:

if (error occured
     if (!(we are scanning the flash && this is a read OOB error))
         printk("error message");

I guess Adrian could just tweak his patch and re-submit.

-- 
Best regards,
Artem Bityutskiy
