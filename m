Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3197C83F26
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1+O8UZPEEfLmLoh9/PYl8w/j1Eiy+ldnBi/7rVZt10=; b=O28UwnJ4MR2MiU
	mA6oPoW0ZvXPBHP0aI0pivgEDto4YgJXKfvZmfdDoHw5rAnfZLMLohSOm0J+v9V9rZaKsoPZJF/VR
	c7+OV6ASbyB3u8qix3QB20tkbvC55GIlzbXDoduqjTCp9u1BpJUKHmm3v0umSVYnKMQmEJs2KCgCQ
	h+vwmQgfG3Ta7tDTjYLwxzUrelXGGjvhhQIhkPgrPz43eKDYvOzx0Et0l+Wi7AKUphoy7G8Bclzwl
	HUDyL31Fz/Es8Y1EMnEAyMyMODP9+O3hJ/8Vmc/60vNMwFOdlyTofGEV0nda+v1+vGqqKBeAJtzsf
	7IWCxklNBp3hnVGgJgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqR6-0000000HN7E-0Pz8;
	Mon, 21 Jul 2025 13:20:08 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udopm-0000000H6rQ-3Vvy
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 11:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1753097812; x=1753702612; i=quwenruo.btrfs@gmx.com;
	bh=zBIsLLD0agXGs83w4tbKBYZqttgfplGTbcXLQzdNcrg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G+7PDLAi1AxvmZ/TaDgO317qqRqOqAN0zAgfp7epxgqYrJfiiIF0XCpbXm5LxS/1
	 wZdVeYgw3hRxCeD6bX7kQB3PKUn+OjtoyKh34v1XGhIZZaQQiUXb0RPIFcx3HoyR4
	 e8XOF/1bybaGC82vrBiWQYlKxNoeOdAuFFdiJjy07qf2Qz/UPCYwq+PLQ+n/3V2wg
	 Wa5aCd5eOd3ksv+PpAHHtX44RqBDQPDwPwxY++QYnBLNXkE6+4NW7KdD9LCt1z1IP
	 c+0mO3x9Pu8RS23gtW6E9WFnR28pgM5fOHCv/4rHi17Ny7a/4yGIYVHILtpWm1fvD
	 2+nvmrn717GJHFxL0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MybGh-1uoDpm0wnN-010ycz; Mon, 21
 Jul 2025 13:36:51 +0200
Message-ID: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
Date: Mon, 21 Jul 2025 21:06:38 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Jan Kara <jack@suse.cz>, Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Hailong Liu <hailong.liu@oppo.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
X-Provags-ID: V03:K1:KDXt1vR1fT3Zmk9s0ZPAImsaPPiOo0tezqUWd5Kf9CdjbZbF7k4
 k3gVPpxoDBzZaxV6R+UYdLWaK1/PTnGXVRZ1s6k8AUc3RGswW9CCDD2U/eWO9Hwv8oYpkYI
 THIoD2qPA/NKqeH2x5OB4BeuIqWMGlXiYNhqMnFs75vdCpTKJCpG82FqfbLeMe6qpgbYlsV
 LdrTRCbJ1pA9hGbTaSpcQ==
UI-OutboundReport: notjunk:1;M01:P0:LrWi0qhLJaY=;eltaPT9HJUWueclF2/CsWbEt+J5
 1GEui3zECGfiiULk3XWx2+yn3UiUXW4j+sEPHvE/E3ZJwXn2hxWktRbvDjwano+WFPmIG1fFo
 hWErgdtk2m7VSaJFIGupIsqokxmyYGAUtdQheWIM1b3feptEZF4gdXsh/qhIgTsM+tbWLD6Cl
 XCcTdARi0ZC95uXE1aAY04zVrTaATadRn0xM0DEIJ1xAhbAJ4VYrE8U6DmNyC/9SAvdf+pOtB
 it9d/Wu114fucjAmQHOg/3YtAOHStyX/xK9Ft47oFTlukxY0J98RQJ2mqX17Pnd8k7TL/wApH
 EIDyi90av+rGLkwwQ+Tj+z883ciBHYKjkcaXEbyTNPHWGii1GHBvR0JE1WQuTU86R/TaGnMhr
 kIXhe3fx0u+QIJvUBvx2F+GVazuhBcjYwjtOWpSb9Z5YbNQyD4QK0v1L7oi3rCGnM6JamoYre
 +HGlGh4jrtF6eh+yGUl5fbE8V9e5rzDajP3XrzPPExuSpI2rFx51/nGlYoQxkWdKlsJL6v1nS
 blOtWjtefdGkWrfX3eiYhCyCcwZG/UHHP7TO5nZd59fe1UbOFppFwbJSqV2K+8ZQTOfCsUjXo
 Qb+l0uphyAikhvx04NU4ddPJ6gd+2JYNM8YkOttzTQAvjVCUnyfRXaBZeWyJ8FqZCkBA1daOn
 ALwAGVkj1ub5aeyVzZx5+6En5MqGlzkuyAdeVANorEfW6vKHgGcBdDtEU5HanrqlPsFIkqwPQ
 jMxblapKLR0jdDtE0j2j00+79dAw2gbFqZkNplUPWyQQF/2j2dn94LpAH6eLXHWpgZnkWrNWU
 xJjaStloWesSNvapwIROjnDmESv7GKvobrHvwbNINFuiSmWi1CbqjZdBbNB6Mm+Oivvby1Zq6
 a6pdEZm3mSfaCdRmOkC7uJL3ewXVvJ4JG2nAtUOoB8f5pv5kGSI0tn82BWS8yq8NZWjpeMEMh
 uTA2wK59o4bOAmPLRTKIce1sRO7SW6EcdSOJ9juR7tIiSApa3zBf/OtikKwZWGvYrpFxtpDc1
 fOEdsGuXiSO9qFa6KDHN1Dl5hHadAA3fQ3Phpm1OCPiV4ew6WJcY+yFKn88fA/h9xYqn5a/VR
 ZRgacObhMAsRn7sMAOyOo5tmAoe1tMqDkYySQr6XNjLozYP4Oob9mSkTVfwKgEEvN95IenTXT
 a8ByQDyTTNfhJVKjwtThvdF0fUwwVXnIbAkQ7T+EOBtMqCiBHzgVKo9/zj9g8PKspgn6cscxE
 sf9dvOF4H2UC0hA3sZ5P9e1rriGQrQ9MXCvt3TqSzP6ABGCPV1V0uqKUEQlU4VosLFaqAA0NP
 FKIJONlIvSvfnJfuJPhwsahhPqegnMtDNcVKSGOwwG+et4NW+xYqPRhqK0+30tKxaxLNAA2ej
 O8xKoHjVwCQm0Tj5phEn9otrsBwcWCVsXHAxAe3vgzRoZNaJk+jmjPk7FOJPKtTiQifds9HAc
 NRf+ASlMbAlTRUraRJosjYT4uXzwQl7kK5+n98JLhCrVYXSX8eb/e3LCSMZFwea5cc1wrGKm+
 s0/Xnt2AgSVMPtmLArPXqKi1LF4rpA7WVW+LBEy9DRShRWRKrHkgQ2Cy4pL4otmxq5iQmQrSh
 3TpzY2+XHqQA876gLsyU5Vx52pOXZmSl7DibjeTFeWpLzkhzCKzpYGUrPlKD873hCYoLNzqtO
 VZ4B0k5ZwrmJrlKQkHdm0rfcGIV58+MH3+cZDnNjxUb2SZON9UTRb1PYnO8joTHzI1SziIH6W
 6sKrgeB/vroZv0MSP3ZXjCaR6e46j4zdKdFZRLnLVKPh3Ksf5QigLZle/CwxTynHLd8CBuKsl
 1JYTf5e/oYGee3UikIFXmBUH9mdnV7BPcZnKxKFnGIUHjazj5xAIo4GA2e9MhxP+bIWbNb5XV
 5Djv14dhTHvnXyxpN/yqMwNGJe5AkYezBd5SVYkzDAGaJuE/MXH2kvmf0HVgIqz+IPnKH7vOd
 y4xxvtPRQ3nMRkx2oLTxaP3JdBv7Ht2Msz7X0F6SCUmNS9OnhQKk0EtMeEVJBcRSwh7HD2d1N
 AsvhEma1g6ht5t6MjblCUQUqN1kRRjtYkWx1m857+6BIG+gPZOS9Zgv297iHtco9xbeYgBmlT
 JD5KRu1ka2mJ3wGWqckx2lPwR9ZgPt9RvvyryOR3CMm0p3LyTIS6m2JdxP9hYjXom0pJla71C
 NM/S22DLAbulIYvXVw/ZmlGAL3inkgGMYs4987MzdI7U8Ils835YlcXw1xReM5/8jbzlvo5DF
 cR7vZl1TNr57caQ24ZQMjSZ3Nh3RF8I3vhXEPXt8W5+rnvg/6+Whw/c6W4NPpLVJDxqSXqxY5
 27gurC7EMN46DkawY66bBJGvltGh5Gb07yQj1z+ND0jGaVhmkYiQXV9nejZJDFw4pcG+XIcm7
 1MBLqS2VtH8iP6nW4wgZXn5h2u6JVdNoZyhNcfc1y3K0jFRXEED4vO8kQTt4HjRXmE9wZxJuH
 7GGZ8tUVjwmyVQBcDLryUOheoiLqDRuzT+FmdkzxvIvmVFQij+dzcRSLGQjocPTCTju6VNV09
 65fagH0i1ei2DUMCjVc+Od43NxWoI093NSQ0++2vhrkDjbcsGMMJ9nIlMUwKMQR4wL+j1H/m3
 rfTJaDJos8BcIUe+dUQDYzeTRgUqzBARcFmP49qDQNOHhUoz2knx6N7P2kzOJ9Q/8hgYdnEmI
 xgYLg14st79df4ZxfsjvfL7bhWIG9xmx9guwULR0gK1IYbcWZNYB0n2mOtnbVLreVDwfbhgcH
 jmhKezEMVPQzm0rtutNj4NC/F4m3fDxrvr44Sx+i8a4TSFJ4964YGYC+OcRZydfSV3hDXTihh
 pbPF9s+31oeyqmiNW7KLKJNqayf4CeDZ5E10CNetzMS6ElATfZ2puVNJ0Mzfndif/f5d9EWmT
 afYAedac0tH+4j+GOEYCeaTxzxBzhfGPCFsXLeSQj/BESTolNsQOmdgc5nxSaWkOPyU5eO+3C
 4EHAoTdEbCsUIXRZiuLH5YDsPeOKrxBvnpfrbKBSvbtyUoDTEB0uX1xQ2qhzGSwRd1NWp+qOA
 jDUMZiBVoIyrFfXVAwqjgb9m/IH1uX9meuJO+1USPECZ702SoasFJegOvo7pVZPy/6gWPbfON
 EqrJOsLp54RbdfhrWLlcgtEZPu7n0OnH2Gac4j9IHw1U1xdoakpAD+y5Ij9qLWRRZfLViU+WW
 iYGSD+1Eh5m8v9W87dNoyscMNegXE5phVJ9WFmWoVBc9piglSrVRhmo3suVGtKPyf99vtWVOE
 HLvXmFo+4cu+Z9H3tVCgcKDj6knDYmZoeRw271rr1Jpi+NS0o+XqtahEtBEjfxDob4Oex1VNX
 jDDKBDcV9uxfzfjbNVF9BKDQmRDpi9xnX3lbJW6wO1UUTf8ejUpjk39qS3KMn9ikZyS7BHkoi
 Rm5H+riqyv9tnedDd7SUb9rh4vZtDBvOWl0k8LPwYXKq/S8Y4XsizTQLmaQzis
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_043731_160944_36D723F3 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyNS83LzIxIDE5OjU1LCBKYW4gS2FyYSDlhpnpgZM6Cj4gT24gTW9uIDIxLTA3LTI1
IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4+IEhpIEJhcnJ5LAo+Pgo+PiBPbiAyMDI1Lzcv
MjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1bCAxNiwgMjAyNSBhdCA4
OjI44oCvQU0gR2FvIFhpYW5nIDxoc2lhbmdrYW9AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgpb
Li4uXQo+Pj4gR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xpb3Ms
IGl0J3MgYWx3YXlzIGEgZ29vZAo+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxsYmFj
ay4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+PiBJIGhhdmUgYSBzbGlnaHRseSBk
aWZmZXJlbnQgcGVyc3BlY3RpdmUg4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPj4+IHRo
b3NlIGRldmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVyIHNo
b3VsZAo+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2UgZm9s
aW9zLgo+Pgo+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11
bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJsaW5n
IGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuICBBdAo+PiBsZWFzdCAic21hbGwiIGxh
cmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVmaXRzIHdoZW4gbWVtb3J5Cj4+IHBy
ZXNzdXJlIGlzIGxpZ2h0Lgo+IAo+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4gdHVu
ZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiBtYXhpbXVtIG9yZGVyIG9mIGEg
Zm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJmcyBhbmQgZXh0NAo+IGFs
cmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRoZSBmdW5jdGlv
bmFsaXR5IGlzIHRoZXJlLAo+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHByb3BlciB1c2Vy
IGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gdHVuZSB0aGlzIGxpbWl0Lgo+IAo+
IAkJCQkJCQkJSG9uemEKCkFuZCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZG9lc24ndCBtZWFuIGFs
bCBmcyBvcGVyYXRpb25zIHdpbGwgZ3JhYiBhbiAKdW5uZWNlc3NhcmlseSBsYXJnZSBmb2xpby4K
CkZvciBidWZmZXJlZCB3cml0ZSwgYWxsIHRob3NlIGZpbGVzeXN0ZW0gd2lsbCBvbmx5IHRyeSB0
byBnZXQgZm9saW9zIGFzIApsYXJnZSBhcyBuZWNlc3NhcnksIG5vdCBvdmVybHkgbGFyZ2UuCgpU
aGlzIG1lYW5zIGlmIHRoZSB1c2VyIHNwYWNlIHByb2dyYW0gaXMgYWx3YXlzIGRvaW5nIGJ1ZmZl
cmVkIElPIGluIGEgCnBvd2VyLW9mLXR3byB1bml0IChhbmQgYWxpZ25lZCBvZmZzZXQgb2YgY291
cnNlKSwgdGhlIGZvbGlvIHNpemUgd2lsbCAKbWF0Y2ggdGhlIGJ1ZmZlciBzaXplIHBlcmZlY3Rs
eSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KClNvIGZvciBwcm9wZXJseSBhbGlnbmVkIGJ1
ZmZlcmVkIHdyaXRlcywgbGFyZ2UgZm9saW9zIHdvbid0IHJlYWxseSBjYXVzZSAKICB1bm5lY2Vz
c2FyaWx5IGxhcmdlIGZvbGlvcywgbWVhbndoaWxlIGJyaW5ncyBhbGwgdGhlIGJlbmVmaXRzLgoK
CkFsdGhvdWdoIEknbSBub3QgZmFtaWxpYXIgZW5vdWdoIHdpdGggZmlsZW1hcCB0byBjb21tZW50
IG9uIGZvbGlvIHJlYWQgCmFuZCByZWFkYWhlYWQuLi4KClRoYW5rcywKUXUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
