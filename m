Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKAze-0000G8-Kj
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 04:39:29 -0400
Message-ID: <4339050F.8020201@yandex.ru>
Date: Tue, 27 Sep 2005 12:38:39 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F6CC7B5950D57B60A67C44E88A0@phx.gbl>
In-Reply-To: <BAY17-F6CC7B5950D57B60A67C44E88A0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
>>          marker_ref->next_in_ino = NULL;
>>          marker_ref->next_phys = NULL;
>>          marker_ref->flash_offset = jeb->offset | REF_NORMAL;
>> -        marker_ref->__totlen = c->cleanmarker_size;
>> +        marker_ref->__totlen = PAD(c->ebh_size);
>> ---------------------------------------------------
>> Why do you use PAD() here? What for?
>>
> I'll not eliminate this PAD(), you may grep "__totlen" to find the
> reason.
I did not ask to remove that so far, I asked why do you use it here?
Is it explainable in words?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
