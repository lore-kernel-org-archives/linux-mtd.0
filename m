Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgRY0-0002fc-Ay
 for linux-mtd@lists.infradead.org; Fri, 10 Apr 2015 05:32:09 +0000
Received: by wgso17 with SMTP id o17so6926493wgs.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Apr 2015 22:31:45 -0700 (PDT)
In-Reply-To: <20150410043000.GQ2677@norris-Latitude-E6410>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
 <20150309230250.GA13266@ld-irv-0074>
 <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
 <20150310173948.GB4124@norris-Latitude-E6410>
 <CAH6sp9M9wMOmRhfN3=vQORkooeN9m8f25_1EuVZ2V6MnA_4Uqw@mail.gmail.com>
 <20150410043000.GQ2677@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
From: Frans Klaver <fransklaver@gmail.com>
Date: Fri, 10 Apr 2015 07:31:39 +0200
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <E3949AB0-118F-4C96-BDDE-8314AD5694C2@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 April 2015 06:30:00 CEST, Brian Norris <computersforpeace@gmail.com> wrote:

>OK, I just made some small edits to the language to clarify that this
>patch is only fixing the 'parent device symlink' rather than the
>'device
>is missing in sysfs'. I also tweaked the language on all the other
>patches to reflect this.

Alright. 

>I ran the other 59 patches through a pretty wide range of compile tests
>and saw no issues, so I've pushed patches 1-29 and 31-60 to l2-mtd.git,
>with small tweaks to the commit descriptions. If you get a chance to
>rework patch 30, feel free.

I was in the process of checking this, until a hd failure threw me off track.
I'll be able to send a reworked 30 after the weekend. 

>Thanks for the patches!

Thanks for testing and rewording, 
Frans 
