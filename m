Received: from mail-wm0-f51.google.com ([74.125.82.51])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW2of-0005Is-80
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 15:15:29 +0000
Received: by mail-wm0-f51.google.com with SMTP id r126so186967478wmr.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 07:15:04 -0800 (PST)
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dcb314@hotmail.com" <dcb314@hotmail.com>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
 <8d72adf5-097f-0c72-edfc-d23d4199e9d4@gmail.com>
 <1485270700.4044.89.camel@infinera.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <87d819b7-8267-7d43-67b0-56c437c9290e@gmail.com>
Date: Tue, 24 Jan 2017 16:14:02 +0100
MIME-Version: 1.0
In-Reply-To: <1485270700.4044.89.camel@infinera.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/24/2017 04:11 PM, Joakim Tjernlund wrote:
> On Tue, 2017-01-24 at 15:52 +0100, Marek Vasut wrote:
>> On 01/24/2017 09:15 AM, David Binderman wrote:
>>> Hello there,
>>>
>>> fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=offset' is always true
>>>
>>> Source code is
>>>
>>>         if (tn->fn->ofs < offset)
>>>             next = tn->rb.rb_right;
>>>         else if (tn->fn->ofs >= offset)
>>>             next = tn->rb.rb_left;
>>>         else
>>>             break;
>>>
>>> Maybe better code
>>>
>>>         if (tn->fn->ofs < offset)
>>>             next = tn->rb.rb_right;
>>>         else if (tn->fn->ofs > offset)
>>>             next = tn->rb.rb_left;
>>>         else
>>>             break;
>>
>> This changes the logic of the code for equality case, please elaborate
>> why this is OK.
> 
> There is something odd with current code:
> 	next = tn_root->rb_node;
> 
> 	while (next) {
> 		tn = rb_entry(next, struct jffs2_tmp_dnode_info, rb);
> 
> 		if (tn->fn->ofs < offset)
> 			next = tn->rb.rb_right;
> 		else if (tn->fn->ofs >= offset)
> 			next = tn->rb.rb_left;
> 		else
> 			break;
> 	}
> 
> The else break; is never reached so the above change makes the break work for ==
> Weather this is correct or not I cannot say.

Indeed, I agree with this one. This is why I asked for more detailed
explanation too :)

-- 
Best regards,
Marek Vasut
