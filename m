Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1zXH-0008Q4-C1
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 15:32:11 +0000
Message-ID: <549444E0.8050109@codeaurora.org>
Date: Fri, 19 Dec 2014 17:31:44 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: t kevin <kevint324@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Get error -74 (ECC error) during ubiattach
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
In-Reply-To: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/19/2014 2:24 PM, t kevin wrote:
> Hi all,
>
> I get below error message everytime when my box boots up.
> It appears there is a ECC error. But such errors should be taken care
> by UBI/UBIFS itself, right?
> Is it because the background thread "ubi_bgt2d" has not started yet so
> no one could do the data scrubbing during ubiattach stage?
> Is it possible to do something like a fsck.ubifs to fix this issue?
>
> The system can boot up correctly but this message is kind of terrifying.

Hi Kevin

Is it always the same block/offset? If so then Richard is right, the PEB 
probably got bad.
Is this first boot up after flashing the image? I encountered similar 
behavior on first boot up after flashing the image. What helped me is to 
generate the image with -F flag, or use a UBI-aware flasher (ubiformat 
for example) to flash it.


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
